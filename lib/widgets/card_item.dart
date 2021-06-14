import 'package:flutter/material.dart';
import 'package:flutter_challenge_fernanda/screens/repository_detail_screen.dart';
import 'package:intl/intl.dart';

import 'item_text.dart';

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
                name: title,
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
