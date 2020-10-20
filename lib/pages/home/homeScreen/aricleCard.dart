// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:deplay_flutter_app/beans/CardList.dart';
// import 'package:deplay_flutter_app/configs/constant.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thrio/thrio.dart';

// Widget articleCard(CardItem item, BuildContext context, GlobalKey key,
//     {Map<String, dynamic> params, bool showTitle = true}) {
//   Map<String, dynamic> itemData = jsonDecode(item.data);

//   Expanded imageWrap = Expanded(
//       child: Container(
//     child: CachedNetworkImage(
//       fit: BoxFit.cover,
//       imageUrl: itemData["pic"],
//       placeholder: (context, url) => Container(
//           constraints: BoxConstraints.expand(), color: Colors.blueGrey),
//       errorWidget: (context, url, error) => Icon(Icons.error),
//     ),
//     constraints: BoxConstraints.expand(),
//   ));

//   Container infoWrap = Container(
//       height: 160,
//       margin: EdgeInsets.only(top: 8, bottom: 8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text("Article",
//               textAlign: TextAlign.start,
//               style: GoogleFonts.notoSans(
//                   fontStyle: FontStyle.normal,
//                   textStyle: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.normal))),
//           Padding(
//             padding: EdgeInsets.only(bottom: 4),
//           ),
//           Text(itemData["title"],
//               textAlign: TextAlign.start,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: GoogleFonts.notoSans(
//                   fontStyle: FontStyle.normal,
//                   textStyle: TextStyle(
//                       fontSize: 24,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700))),
//           Padding(
//             padding: EdgeInsets.only(bottom: 4),
//           ),
//           Text(itemData["remark"],
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.start,
//               style: GoogleFonts.notoSans(
//                   fontStyle: FontStyle.italic,
//                   textStyle: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.normal)))
//         ],
//       ));

//   var widget = PhysicalModel(
//     color: Colors.white,
//     elevation: 4,
//     borderRadius: BorderRadius.circular(10),
//     clipBehavior: Clip.antiAlias,

//     //抗锯齿
//     child: Container(
//       decoration: BoxDecoration(color: Colors.white),
//       child: Column(
//         children: <Widget>[
//           Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[infoWrap],
//               ),
//               color: Colors.white,
//               padding: EdgeInsets.all(16.0)),
//           imageWrap,
//         ],
//       ),
//     ),
//   );

//   return InkWell(
//       child: widget,
//       onTap: () => ThrioNavigator.push(
//           url: RouteList.NATIVE_WEBVIEW,
//           params: {
//             "url": itemData["url"],
//             "orientation": "vertical",
//             "fullscreen": false,
//             "title": null,
//             ...params
//           },
//           animated: false,
//           poppedResult: (dynamic value) {
//             print("popResultValue :$value");
//           }));
// }
