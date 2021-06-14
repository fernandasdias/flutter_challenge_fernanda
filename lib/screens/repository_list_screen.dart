import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/presentation/bloc/repository_bloc.dart';
import 'package:flutter_challenge_fernanda/widgets/custom_app_bar_widget.dart';
import 'package:intl/intl.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      // backgroundColor: Colors.black12,
      // title: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [Text('Hi,'), Text('@wearereasonablepeople')],
      // ),
      // bottom: TabBar(
      //   tabs: [
      //     Tab(icon: Icon(Icons.directions_car)),
      //     Tab(icon: Icon(Icons.directions_car)),
      //   ],
      // ),

      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
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
                    return Container(
                      child: ListView.builder(
                        itemCount: state.repositoryListModel.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardItem(
                            title: state.repositoryListModel.list[index].name ??
                                '',
                            createdAt:
                                state.repositoryListModel.list[index].createdAt,
                          );
                        },
                      ),
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

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.title,
    required this.createdAt,
  }) : super(key: key);
  final String title;
  final DateTime? createdAt;
  @override
  Widget build(BuildContext context) {
    print('teste');
    DateFormat formatter = DateFormat('dd-MM-yy');
    return Card(
      // elevation: 2.0,
      margin: EdgeInsets.only(top: 12),
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            if (createdAt != null)
              Text(
                formatter.format(createdAt!).toString(),
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
