part of 'plants_bloc.dart';

sealed class PlantsEvent extends Equatable {
  const PlantsEvent();

  @override
  List<Object?> get props => [];
}

final class FetchPlantsEvent extends PlantsEvent {
  const FetchPlantsEvent();
}

final class SearchPlantsEvent extends PlantsEvent {
  final String query;

  const SearchPlantsEvent(this.query);

  @override
  List<Object?> get props => [query];
}
