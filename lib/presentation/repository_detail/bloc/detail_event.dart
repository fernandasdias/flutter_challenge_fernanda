part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchRepositoryDetail extends DetailEvent {
  final String name;

  FetchRepositoryDetail(this.name);
}
