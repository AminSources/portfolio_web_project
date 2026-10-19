import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';

part 'works_event.dart';
part 'works_state.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  final GetWorksUsecase getWorksUsecase;

  WorksBloc({required this.getWorksUsecase}) : super(WorksInitial()) {
    on<LoadWorkEvent>(_getWorks);
  }

  void _getWorks(LoadWorkEvent event, emit) async {
    //? set state on loading
    emit(WorksLoading());

    //? call get works usecase
    final dataState = await getWorksUsecase(null);

    if (dataState is DataSuccess) {
      emit(WorksSuccess(dataState.data!));
    } else {
      emit(WorksFailure(dataState.message!));
    }
  }
}
