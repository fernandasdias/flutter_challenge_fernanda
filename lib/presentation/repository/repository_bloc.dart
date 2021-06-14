import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_fernanda/data/models/repository_model.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:meta/meta.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GithubRepository repository;
  RepositoryBloc(this.repository)
      : super(RepositoryInitial(RepositoryListModel()));

  @override
  Stream<RepositoryState> mapEventToState(
    RepositoryEvent event,
  ) async* {
    if (event is FetchRepositoriesEvent) {
      RepositoryListModel _repositoryList = RepositoryListModel();
      yield LoadingRepositoriesState();
      try {
        _repositoryList = await repository.fetchGithubRepositories();
        yield LoadedRepositoriesState(_repositoryList);
      } on Exception catch (e) {
        FailureState(_repositoryList);
      }
    }
  }
}
