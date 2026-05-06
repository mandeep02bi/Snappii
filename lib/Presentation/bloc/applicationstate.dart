import 'package:snappis/Domains/Entities/CreatorApplication.dart';

class ApplicationState {
  final List<CreatorApplication> creators;

  ApplicationState({required this.creators});

  factory ApplicationState.initial() =>
      ApplicationState(creators: []);
}
