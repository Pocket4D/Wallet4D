import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thrio/thrio.dart';

Widget customNavigator({double width, double height, Function onPressed}) {
  return SizedBox(
    width: width,
    child: Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 8),
      // color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: 24.0,
            color: Colors.black,
            icon: Icon(
              Icons.settings,
            ),
            onPressed: onPressed ??
                () {
                  print("go to settings");
                },
          )
        ],
      ),
    ),
  );
}
