import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    Key? key,
    required this.title,
    required this.size,
    this.style,
  }) : super(key: key);
  final TextStyle? style;
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
              style: style ?? TextStyle(fontSize: size),
            ),
          ),
        ],
      ),
    );
  }
}
