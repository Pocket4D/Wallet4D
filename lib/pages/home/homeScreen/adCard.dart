import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:wallet4d/beans/CardList.dart';
// import 'package:wallet4d/configs/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrio/thrio.dart';

Widget adCard(dynamic item, BuildContext context, GlobalKey key,
    {Map<String, dynamic> params, bool showTitle = true}) {
  Map<String, dynamic> itemData = jsonDecode(item.data);

  var widget = PhysicalModel(
    color: Colors.white,
    elevation: 4,
    borderRadius: BorderRadius.circular(10),
    clipBehavior: Clip.antiAlias,

    //抗锯齿
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: itemData["pic"],
                  placeholder: (context, url) =>
                      Container(constraints: BoxConstraints.expand(), color: Colors.blueGrey),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                constraints: BoxConstraints.expand(),
              )),
            ],
          ),
        ),
        Visibility(
            visible: showTitle,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black12, Colors.black54, Colors.black87])),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Today's Choice",
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(item.title,
                              style: GoogleFonts.bungeeShade(
                                  fontStyle: FontStyle.normal,
                                  textStyle: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700))),
                          Padding(padding: EdgeInsets.only(bottom: 16)),
                          Text(itemData["remark"],
                              style: GoogleFonts.notoSans(
                                  fontStyle: FontStyle.normal,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )))
                        ],
                      )
                    ],
                  ),
                  constraints: BoxConstraints.expand(),
                ))),
      ],
    ),
  );
  return InkWell(child: widget, onTap: () {}
      // onTap: () => ThrioNavigator.push(
      //     url: RouteList.NATIVE_WEBVIEW,
      //     params: {
      //       "url": itemData["url"],
      //       "orientation": "vertical",
      //       "fullscreen": false,
      //       "title": null,
      //       ...params
      //     },
      //     animated: false,
      //     poppedResult: (dynamic value) {
      //       print("popResultValue :$value");
      //     })
      );
}
