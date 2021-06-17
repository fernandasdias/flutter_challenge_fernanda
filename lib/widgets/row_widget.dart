import 'package:flutter/material.dart';
import 'package:flutter_challenge_fernanda/presentation/repository_detail/bloc/detail_bloc.dart';
import 'package:flutter_challenge_fernanda/theme/theme.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.state,
    required this.title,
    required this.description,
    this.colorDescription,
  }) : super(key: key);
  final String title;
  final String description;
  final LoadedState state;
  final Color? colorDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: AppColorTheme.darkModeSubtitle),
        ),
        Container(
          child: Text(
            description,
            style: TextStyle(
                color: colorDescription ?? AppColorTheme.darkModeTitle,
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
