part of 'repositorydetail_bloc.dart';

abstract class RepositorydetailState extends Equatable {
  const RepositorydetailState();

  @override
  List<Object> get props => [];
}

class RepositorydetailInitial extends RepositorydetailState {}

class LoadingState extends RepositorydetailState {}
