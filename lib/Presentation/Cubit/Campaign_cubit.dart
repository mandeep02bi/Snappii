import 'package:flutter_bloc/flutter_bloc.dart';

class CampaignCubit extends Cubit<int> {
  CampaignCubit() : super(0);

  void nextStep() {
    if (state < 3) emit(state + 1);
  }

  void goTo(int index) {
    emit(index);
  }
}
