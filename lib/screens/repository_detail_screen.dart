import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:flutter_challenge_fernanda/presentation/repository_detail/bloc/detail_bloc.dart';
import 'package:flutter_challenge_fernanda/theme/theme.dart';
import 'package:flutter_challenge_fernanda/widgets/row_widget.dart';
import 'package:intl/intl.dart';

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
    return BlocBuilder<DetailBloc, DetailState>(
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
    DateFormat formatter = DateFormat('dd/MM/yy');
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColorTheme.darkModeBackground,
      // ),
      backgroundColor: AppColorTheme.darkModeBackground,
      body: SafeArea(
        minimum: EdgeInsets.all(12),
        child: Container(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: AppColorTheme.darkModeTitle,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        // color: Colors.blue,
                        margin: EdgeInsets.only(top: 32, bottom: 32),
                        child: Text(
                          state.repositoryName,
                          style: TextStyle(
                              color: AppColorTheme.darkModeTitle,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, bottom: 24),
                child: Text(
                  'Latest Commits',
                  style: TextStyle(
                      color: AppColorTheme.darkModeSecondaryTitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: state.repositoryDetail.commits.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColorTheme.darkModeSubtitle, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              state.repositoryDetail.commits[index].message,
                              style: TextStyle(
                                color: AppColorTheme.darkModeSubtitle,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (state.repositoryDetail.commits[index].committer
                                  .date !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: RowWidget(
                                  state: state,
                                  title: 'Date: ',
                                  colorDescription:
                                      AppColorTheme.darkModeSubtitle,
                                  description: formatter
                                      .format(state.repositoryDetail
                                          .commits[index].committer.date!)
                                      .toString()),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: RowWidget(
                                state: state,
                                title: 'Author: ',
                                description: state.repositoryDetail
                                    .commits[index].author.name),
                          ),
                        ],
                      ),
                    );
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
