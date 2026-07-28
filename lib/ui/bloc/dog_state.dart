import 'package:equatable/equatable.dart';

import '../../data/model/dog_model.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object?> get props => [];
}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<DogModel> dogs;

  const DogLoaded(this.dogs);

  @override
  List<Object?> get props => [dogs];
}

class DogError extends DogState {
  final String message;

  const DogError(this.message);

  @override
  List<Object?> get props => [message];
}