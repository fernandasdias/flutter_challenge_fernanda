part of 'repository_bloc.dart';

@immutable
abstract class RepositoryEvent {}

class FetchRepositoriesEvent extends RepositoryEvent {}
