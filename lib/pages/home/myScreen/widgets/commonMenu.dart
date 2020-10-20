import 'package:flutter/material.dart';

Widget commonMenu(Icon menuIcon, String text, Function onTap) {
  return InkWell(
      onTap: onTap,
      child: Container(
        color:Colors.white,
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                menuIcon,
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
