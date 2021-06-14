import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:flutter_challenge_fernanda/presentation/repository_detail/bloc/repositorydetail_bloc.dart';

class RepositoryDetailScreen extends StatefulWidget {
  const RepositoryDetailScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  final int id;
  final String name;
  @override
  _RepositoryDetailScreenState createState() => _RepositoryDetailScreenState();
}

class _RepositoryDetailScreenState extends State<RepositoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryDetailBloc(GithubRepositoryImpl())
        ..add(FetchRepositoryDetail(widget.name)),
      child: DetailBody(
        id: widget.id,
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(appBar: AppBar(), body: Container());
  }
}
