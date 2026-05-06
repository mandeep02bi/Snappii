import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';

abstract class BookingEvent {}

class InitializeServices extends BookingEvent {
  final List<ServiceEntity1> services;
  InitializeServices(this.services);
}

class IncreaseQuantity extends BookingEvent {
  final int index;
  IncreaseQuantity(this.index);
}

class DecreaseQuantity extends BookingEvent {
  final int index;
  DecreaseQuantity(this.index);
}

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingUpdated extends BookingState {
  final List<ServiceEntity1> services;
  BookingUpdated(this.services);
}

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  List<ServiceEntity1> _services = [];

  BookingBloc() : super(BookingInitial()) {
    on<InitializeServices>((event, emit) {
      _services = event.services;
      emit(BookingUpdated(_services));
    });

   on<IncreaseQuantity>((event, emit) {
  if (state is BookingUpdated) {
    
    final currentState = state as BookingUpdated;

    final updatedServices =
        List<ServiceEntity1>.from(currentState.services);

    final oldService = updatedServices[event.index];

    updatedServices[event.index] = ServiceEntity1(
      title: oldService.title,
      description: oldService.description,
      price: oldService.price,
      quantity: oldService.quantity + 1,
    );
      print("Increased: ${updatedServices[event.index].quantity}");
    emit(BookingUpdated(updatedServices));
  }
});
    // on<DecreaseQuantity>((event, emit) {
    //   if (_services[event.index].quantity > 1) {
    //     _services[event.index].quantity--;
    //     emit(BookingUpdated(List.from(_services)));
    //   }
    // });
    on<DecreaseQuantity>((event, emit) {
      if (state is BookingUpdated) {
        final currentState = state as BookingUpdated;

        final updatedServices =
            List<ServiceEntity1>.from(currentState.services);

        final oldService = updatedServices[event.index];

        if (oldService.quantity > 0) {
          updatedServices[event.index] = ServiceEntity1(
            title: oldService.title,
            description: oldService.description,
            price: oldService.price,
            quantity: oldService.quantity - 1,
          );

          emit(BookingUpdated(updatedServices));
        }
      }
    });
  }
}