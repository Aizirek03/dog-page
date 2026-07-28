import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/repository.dart';
import 'dog_event.dart';
import 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final Repository repository;

  DogBloc(this.repository) : super(DogInitial()) {
    on<GetDogsEvent>((event, emit) async {
      emit(DogLoading());

      try {
        final dogs = await repository.getDogs();
        emit(DogLoaded(dogs));
      } catch (e) {
        emit(DogError(e.toString()));
      }
    });
  }
}