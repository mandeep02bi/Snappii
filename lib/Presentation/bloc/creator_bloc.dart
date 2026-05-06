import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Data/Models/Creator_insta_model.dart';

abstract class CreatorEvent {}

class FetchCreators extends CreatorEvent {}

abstract class CreatorState {}

class CreatorInitial extends CreatorState {}

class CreatorLoading extends CreatorState {}

class RefreshCreators extends CreatorEvent {}


class CreatorLoaded extends CreatorState {
  final List<CreatorInstaModel> creators;
  CreatorLoaded(this.creators);
}

class CreatorError extends CreatorState {}
class CreatorBloc extends Bloc<CreatorEvent, CreatorState> {

  CreatorBloc() : super(CreatorInitial()) {

    on<FetchCreators>(_fetchCreators);

    on<RefreshCreators>(_refreshCreators);   // ✅ Add this
  }

  Future<void> _fetchCreators(
    FetchCreators event,
    Emitter<CreatorState> emit,
  ) async {

    emit(CreatorLoading());

    final response =
        await ApiService.getAPI("api/creator/creators");

    if (response["status"] == true) {

      List data = response["data"]["data"];

      final creators =
          data.map((e) => CreatorInstaModel.fromJson(e)).toList();

      emit(CreatorLoaded(creators));

    } else {
      emit(CreatorError());
    }
  }


  /// ✅ Refresh uses same API call
  Future<void> _refreshCreators(
    RefreshCreators event,
    Emitter<CreatorState> emit,
  ) async {

    final response =
        await ApiService.getAPI("api/creator/creators");

    if (response["status"] == true) {

      List data = response["data"]["data"];

      final creators =
          data.map((e) => CreatorInstaModel.fromJson(e)).toList();

      emit(CreatorLoaded(creators));

    } else {
      emit(CreatorError());
    }
  }

}

