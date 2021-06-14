part of 'repositorydetail_bloc.dart';

abstract class RepositorydetailEvent extends Equatable {
  const RepositorydetailEvent();

  @override
  List<Object> get props => [];
}

class FetchRepositoryDetail extends RepositorydetailEvent {}
