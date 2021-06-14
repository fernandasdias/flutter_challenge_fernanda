import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';

part 'repositorydetail_event.dart';
part 'repositorydetail_state.dart';

class RepositoryDetailBloc
    extends Bloc<RepositorydetailEvent, RepositorydetailState> {
  RepositoryDetailBloc(this.repository) : super(RepositorydetailInitial());
  final GithubRepository repository;

  @override
  Stream<RepositorydetailState> mapEventToState(
    RepositorydetailEvent event,
  ) async* {
    if (event is FetchRepositoryDetail) {
      yield LoadingState();
      await repository.fetchRepositoryDetail(event.name);
    }
  }
}
