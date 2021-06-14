import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:flutter_challenge_fernanda/presentation/repository_detail/bloc/detail_bloc.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailBloc(GithubRepositoryImpl())..add(FetchRepositoryDetail(name)),
      child: DetailBody(),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is LoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is LoadedState)
            return Body(
              state: state,
            );

          if (state is FailureState)
            return Container(
              child: Text('Failed to fetch data'),
            );
          return Container();
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.state,
  }) : super(key: key);
  final LoadedState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(12),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.repositoryDetail.commits.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(9)),
                        margin: EdgeInsets.all(6),
                        // color: Colors.black12,
                        child: Text(
                            state.repositoryDetail.commits[index].message));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
