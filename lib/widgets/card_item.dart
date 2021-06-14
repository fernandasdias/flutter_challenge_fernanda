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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RepositoryDetailScreen(
                  id: id,
                  name: title,
                )));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.book_rounded),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemText(title: title, size: 20),
                      if (description.isNotEmpty)
                        ItemText(title: description.toString(), size: 16),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (createdAt != null) buildCreatedAt(formatter),
                            if (numberOfStars != null) buildStarsRow()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ItemText buildCreatedAt(DateFormat formatter) {
    return ItemText(
        title: 'Created at ' + formatter.format(createdAt!).toString(),
        size: 14);
  }

  Widget buildStarsRow() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 6,
        ),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Container(
                margin: EdgeInsets.only(left: 4),
                child: Text(
                  numberOfStars.toString(),
                  style: TextStyle(fontSize: 14),
                )),
          ],
        ),
      ),
    );
  }
}
