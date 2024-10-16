part of 'plants_bloc.dart';

sealed class PlantsState extends Equatable {
  const PlantsState();

  @override
  List<Object> get props => [];
}

final class InitialPlantsState extends PlantsState {
  const InitialPlantsState();
}

final class FetchingPlantsState extends PlantsState {
  const FetchingPlantsState();
}

final class FetchedPlantsState extends PlantsState {
  final List<Plant> plants;

  const FetchedPlantsState(this.plants);

  @override
  List<Object> get props => [plants];
}

final class NoPlantsState extends PlantsState {
  const NoPlantsState();
}

final class ErrorFetchingPlantsState extends PlantsState {
  final String error;

  const ErrorFetchingPlantsState(this.error);

  @override
  List<Object> get props => [error];
}