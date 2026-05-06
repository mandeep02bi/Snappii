import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Core/Api/ApiServices.dart';

abstract class CreatorDetailEvent {}

class FetchCreatorDetail extends CreatorDetailEvent {
  final String creatorId;
  FetchCreatorDetail(this.creatorId);
}

abstract class CreatorDetailState {}

class CreatorDetailInitial extends CreatorDetailState {}

class CreatorDetailLoading extends CreatorDetailState {}

class CreatorDetailLoaded extends CreatorDetailState {
  final Map<String, dynamic> creator;
  CreatorDetailLoaded(this.creator);
}

class CreatorDetailError extends CreatorDetailState {}

class CreatorDetailBloc
    extends Bloc<CreatorDetailEvent, CreatorDetailState> {

  CreatorDetailBloc() : super(CreatorDetailInitial()) {
    on<FetchCreatorDetail>(_fetchDetail);
  }

  Future<void> _fetchDetail(
    FetchCreatorDetail event,
    Emitter<CreatorDetailState> emit,
  ) async {

    emit(CreatorDetailLoading());

    final response = await ApiService.getAPI(
        "api/creator/creators/${event.creatorId}");

    if (response["status"] == true) {
      emit(CreatorDetailLoaded(response["data"]));
    } else {
      emit(CreatorDetailError());
    }
  }
}
