import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/presentation/repository/repository_bloc.dart';
import 'package:flutter_challenge_fernanda/screens/repository_detail_screen.dart';
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
                            language: state
                                    .repositoryListModel.list[index].language ??
                                '',
                            description: state
                                .repositoryListModel.list[index].description,
                            numberOfStars: state
                                .repositoryListModel.list[index].numberStars,
                            id: state.repositoryListModel.list[index].id,
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
    required this.language,
    required this.description,
    required this.numberOfStars,
    required this.id,
  }) : super(key: key);
  final String title;
  final DateTime? createdAt;
  final String language;
  final String description;
  final int? numberOfStars;
  final int id;
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd/MM/yy');
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => RepositoryDetailScreen(
                id: id,
              ))),
      child: Card(
        // elevation: 2.0,
        margin: EdgeInsets.only(top: 12),
        shadowColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.book_rounded),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemText(title: title, size: 20),
                    if (description.isNotEmpty)
                      ItemText(title: description.toString(), size: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (createdAt != null)
                          ItemText(
                              title: 'Created at ' +
                                  formatter.format(createdAt!).toString(),
                              size: 12),
                        if (numberOfStars != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                                Text(numberOfStars.toString()),
                              ],
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemText extends StatelessWidget {
  const ItemText({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Column(
        children: [
          Container(
            // color: Colors.amber,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(fontSize: size),
            ),
          ),
        ],
      ),
    );
  }
}
