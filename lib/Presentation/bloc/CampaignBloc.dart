import 'package:flutter_bloc/flutter_bloc.dart';

class CampaignEvent {}

class UpdateCounter extends CampaignEvent {
  final int value;
  UpdateCounter(this.value);
}

class CampaignState {
  final int counter;
  CampaignState({required this.counter});
}

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  CampaignBloc() : super(CampaignState(counter: 0)) {
    on<UpdateCounter>((event, emit) {
      emit(CampaignState(counter: event.value));
    });
  }
}
