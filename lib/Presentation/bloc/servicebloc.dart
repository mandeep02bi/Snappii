import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Entities/Serviceentity.dart';

abstract class ServiceEvent {}

class LoadServices extends ServiceEvent {}

class ServiceState {
  final List<ServiceEntity> services;
  ServiceState(this.services);
}

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceState([])) {
    on<LoadServices>((event, emit) {
      final data = List.generate(
        15,
        (index) => ServiceEntity(
          id: "#CMP-00$index",
          name: "Date & Vime 30",
          company: "Summer Launch 2026",
          amount: "\$5,000.00",
          status: index % 3 == 0
              ? "Completed"
              : index % 3 == 1
                  ? "Paused"
                  : "Failed",
        ),
      );

      emit(ServiceState(data));
    });
  }
}
