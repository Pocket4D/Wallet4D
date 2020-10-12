import 'package:flutter/material.dart';

Widget commonListItem(Icon menuIcon, String text, Function onTap) {
  return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                menuIcon ??
                    Container(
                      width: 0,
                      height: 0,
                    ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ));
}
