import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Entities/CreatorApplication.dart';
import 'package:snappis/Presentation/bloc/applicationevent.dart';
import 'package:snappis/Presentation/bloc/applicationstate.dart';

class ApplicationBloc
    extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState.initial()) {
    on<LoadApplications>((event, emit) {
      emit(ApplicationState(creators: [
        CreatorApplication(
          creatorName: "Jane_Creative",
          totalApplications: 35,
          appliedCampaigns: [
            "Fit & Tone",
            "Detox Plan",
            "Summer Drop"
          ],
        ),
        CreatorApplication(
          creatorName: "InfluencerLeo",
          totalApplications: 22,
          appliedCampaigns: [
            "New Product Launch",
            "Summer 2026"
          ],
        ),
      ]));
    });
  }
}
