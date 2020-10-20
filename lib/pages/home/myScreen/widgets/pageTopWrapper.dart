import 'package:cached_network_image/cached_network_image.dart';
// import 'package:wallet4d/beans/LoginInfo.dart';
// import 'package:wallet4d/configs/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:thrio/thrio.dart';

Widget pageTopWrapper({@required double width, @required String walletName}) {
  print("address: $walletName");

  var avatar = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(width: 24, height: 24),
      CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: '',
        imageBuilder: (context, imageBuilder) => CircleAvatar(
          backgroundImage: imageBuilder,
          backgroundColor: Colors.deepPurple[100],
          radius: 32,
        ),
        placeholder: (context, url) => Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: Colors.deepPurple[100],
          ),
        ),
        errorWidget: (context, url, error) => Container(
          child: Icon(Icons.error),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: Colors.deepPurple[100],
          ),
        ),
      ),
      Icon(
        Icons.chevron_right,
        size: 24,
      )
    ],
  );

  var userNameText = Text(walletName ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: GoogleFonts.notoSans(
          fontStyle: FontStyle.normal,
          textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700)));

  return InkWell(
      onTap: () {
        print("ontap avatar");
      },
      child: Container(
          width: width,
          padding: EdgeInsets.only(top: 64, bottom: 64, right: 16, left: 16),
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                avatar,
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                ),
                userNameText,
              ])));
}
