import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden/models/plant.dart';
import 'package:my_garden/repositories/plants_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'plants_event.dart';

part 'plants_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  final PlantsRepository plantsRepository;

  PlantsBloc({
    required this.plantsRepository,
  }) : super(const InitialPlantsState()) {
    on<FetchPlantsEvent>(_onFetch);
    on<SearchPlantsEvent>(
      _onSearch,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  void fetch() => add(const FetchPlantsEvent());

  void search(String query) => add(SearchPlantsEvent(query));

  void _onFetch(FetchPlantsEvent event, Emitter<PlantsState> emit) async {
    emit(const FetchingPlantsState());

    try {
      final plants = await plantsRepository.plants;
      emit(plants.isNotEmpty
          ? FetchedPlantsState(plants)
          : const NoPlantsState());
    } catch (error) {
      emit(const ErrorFetchingPlantsState('Error fetching plants'));
    }
  }

  void _onSearch(SearchPlantsEvent event, Emitter<PlantsState> emit) async {
    emit(const FetchingPlantsState());

    try {
      final plants = await plantsRepository.search(event.query);
      emit(plants.isNotEmpty
          ? FetchedPlantsState(plants)
          : const NoPlantsState());
    } catch (error) {
      emit(const ErrorFetchingPlantsState('Error searching plants'));
    }
  }
}