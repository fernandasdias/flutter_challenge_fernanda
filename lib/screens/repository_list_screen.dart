import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/presentation/repository/repository_bloc.dart';
import 'package:flutter_challenge_fernanda/theme/theme.dart';
import 'package:flutter_challenge_fernanda/widgets/card_item.dart';
import 'package:flutter_challenge_fernanda/widgets/custom_app_bar_widget.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.darkModeBackground,
      appBar: CustomAppBar(),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: BlocBuilder<RepositoryBloc, RepositoryState>(
                builder: (context, state) {
                  if (state is LoadingRepositoriesState)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (state is LoadedRepositoriesState)
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.blue,
                          margin:
                              EdgeInsets.only(top: 12, bottom: 24, left: 16),
                          child: Text(
                            'Repositories ',
                            style: TextStyle(
                                color: AppColorTheme.darkModeSecondaryTitle,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemCount: state.repositoryListModel.list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardItem(
                                  title: state.repositoryListModel.list[index]
                                          .name ??
                                      '',
                                  createdAt: state.repositoryListModel
                                      .list[index].createdAt,
                                  language: state.repositoryListModel
                                          .list[index].language ??
                                      '',
                                  description: state.repositoryListModel
                                      .list[index].description,
                                  numberOfStars: state.repositoryListModel
                                      .list[index].numberStars,
                                  id: state.repositoryListModel.list[index].id,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  if (state is FailureState) return Text('Failure');
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
