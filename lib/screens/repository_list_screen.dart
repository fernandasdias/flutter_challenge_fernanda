import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/presentation/bloc/repository_bloc.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RepositoryBloc, RepositoryState>(
          builder: (context, state) {
            if (state is LoadingRepositoriesState)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is LoadedRepositoriesState)
              return Container(
                child: ListView.builder(
                  itemCount: state.repositoryListModel.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          state.repositoryListModel.list[index].name ?? ''),
                    );
                  },
                ),
              );
            return Container();
          },
        ),
      ),
    );
  }
}
