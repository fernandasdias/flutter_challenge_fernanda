import 'package:flutter/material.dart';
import 'package:flutter_challenge_fernanda/theme/theme.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar()
      : super(
          preferredSize: Size.fromHeight(120),
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 45, right: 16, bottom: 16),
            // color: Colors.amber,
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
                    // color: Colors.black12,
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
              color: AppColorTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
// decoration: BoxDecoration(
//                     color: Colors.black12,
//                     // boxShadow: [
//                     //   BoxShadow(
//                     //     color: Colors.black12,
//                     //     offset: Offset(-1, 1),
//                     //     blurRadius: 4,
//                     //     spreadRadius: 0,
//                     //   ),
//                     // ],
//                     // color: Colors.black12,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     )),

Widget buildFirstRow() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hi,',
          style: TextStyle(
              color: AppColorTheme.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

//    {
//     return AppBar(
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [Text('Hi,'), Text('@wearereasonablepeople')],
//       ),
//       centerTitle: false,
//       backgroundColor: Colors.transparent,
//       // leading: InkWell(
//       //   splashColor: Colors.transparent,
//       //   highlightColor: Colors.transparent,
//       //   onTap: () => Navigator.of(context).pop(false),
//       //   child: Image.network(
//       //     url,
//       //     height: 54,
//       //     fit: BoxFit.fitHeight,
//       //   ),
//       // ),
//       bottom: TabBar(
//         tabs: [
//           Tab(icon: Icon(Icons.book)),
//           Tab(icon: Icon(Icons.account_box)),
//         ],
//       ),
//     );
//   }
// }
