part of 'repository_bloc.dart';

@immutable
abstract class RepositoryState extends Equatable {
  final RepositoryListModel repositoryListModel;

  RepositoryState(this.repositoryListModel);
  @override
  List<Object> get props => [repositoryListModel];
}

class RepositoryInitial extends RepositoryState {
  RepositoryInitial(RepositoryListModel repositoryListModel)
      : super(repositoryListModel);
}

class LoadingRepositoriesState extends RepositoryState {
  LoadingRepositoriesState() : super(RepositoryListModel());
}

class LoadedRepositoriesState extends RepositoryState {
  LoadedRepositoriesState(RepositoryListModel repositoryListModel)
      : super(repositoryListModel);
}

class FailureState extends RepositoryState {
  FailureState(RepositoryListModel repositoryListModel)
      : super(repositoryListModel);
}
