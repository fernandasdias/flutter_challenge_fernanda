import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_fernanda/data/models/repository_detail.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(this.repository) : super(DetailInitial());
  final GithubRepository repository;
  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is FetchRepositoryDetail) {
      yield LoadingState();
      try {
        RepositoryDetail repositoryDetail =
            await repository.fetchRepositoryDetail(event.name);
        yield LoadedState(repositoryDetail);
      } on Exception catch (e) {
        yield FailureState();
      }
      print('Fetching detail');
    }
  }
}
