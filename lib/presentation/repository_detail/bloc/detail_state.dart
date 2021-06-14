part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class LoadingState extends DetailState {}

class FailureState extends DetailState {}

class LoadedState extends DetailState {
  final RepositoryDetail repositoryDetail;

  LoadedState(this.repositoryDetail);
}
