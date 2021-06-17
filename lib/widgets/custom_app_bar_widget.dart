import 'package:flutter/material.dart';
import 'package:flutter_challenge_fernanda/theme/theme.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar()
      : super(
          preferredSize: Size.fromHeight(100),
          child: Container(
            // color: Colors.red,
            padding: EdgeInsets.only(left: 16, top: 45, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    // color: Colors.black12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildFirstRow(),
                        buildSecondRow(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: AppColorTheme.darkModeSubtitle, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/1932180?s=200&v=4',
                      width: 56,
                      height: 56,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}

Container buildSecondRow() {
  return Container(
    // color: Colors.amberAccent,
    child: Row(
      children: [
        Text(
          '@wearereasonablepeople',
          style: TextStyle(
              color: AppColorTheme.darkModeUsernameTitle,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildFirstRow() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hi',
          style: TextStyle(
              color: AppColorTheme.darkModeTitle,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
