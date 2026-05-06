import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Entities/Brand_entity.dart';

abstract class BrandEvent {}

class LoadBrands extends BrandEvent {}

class BrandState {
  final List<BrandEntity> brands;
  BrandState(this.brands);
}

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(BrandState([])) {
    on<LoadBrands>((event, emit) {
      final data = List.generate(
        12,
        (index) => BrandEntity(
          title: "Date & Vime 30",
          company: "Apex Corp.",
          campaign: "Summer Launch 2026",
          status: index % 2 == 0 ? "Active" : "Paused",
        ),
      );
      emit(BrandState(data));
    });
  }
}
