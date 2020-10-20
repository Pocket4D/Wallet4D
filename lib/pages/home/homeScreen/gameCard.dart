// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:deplay_flutter_app/beans/CardList.dart';
// import 'package:deplay_flutter_app/configs/constant.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thrio/thrio.dart';

// Widget gameCard(CardItem item, BuildContext context, GlobalKey key,
//     {Map<String, dynamic> params, bool showTitle = true}) {
//   Map<String, dynamic> itemData = jsonDecode(item.data);
//   itemData["from"] = "card_home";

//   var orientation = itemData['direction'] == 2 ? "horizontal" : "vertical";

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

//   Container iconWrap = Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
//       height: 60,
//       width: 60,
//       child: CachedNetworkImage(
//         fit: BoxFit.cover,
//         imageUrl: itemData["icon"],
//         placeholder: (context, url) => Container(
//             constraints: BoxConstraints.expand(),
//             color: Colors.deepPurple[100]),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       ));

//   Container infoWrap = Container(
//       padding: EdgeInsets.only(top: 0, bottom: 32),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.baseline,
//         textBaseline: TextBaseline.alphabetic,
//         children: <Widget>[
//           Hero(tag: 'gameIcon_${itemData["gid"]}', child: iconWrap),
//           SizedBox(
//             height: 80,
//             child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(itemData["name"],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.start,
//                         style: GoogleFonts.notoSans(
//                             fontStyle: FontStyle.normal,
//                             textStyle: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700))),
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 4),
//                     ),
//                     Text(itemData["remark"],
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.start,
//                         style: GoogleFonts.notoSans(
//                             fontStyle: FontStyle.normal,
//                             textStyle: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal)))
//                   ],
//                 ),
//                 padding: EdgeInsets.only(left: 8),
//                 constraints: BoxConstraints.expand(
//                     width: MediaQuery.of(context).size.width - 153)),
//           )
//         ],
//       ));

//   Container buttonWrap = Container(
//       height: 50,
//       child: SizedBox(
//           child: FlatButton(
//             padding: EdgeInsets.only(left: 64, right: 64),
//             textTheme: ButtonTextTheme.primary,
//             color: Colors.deepPurple,
//             child: Text("Play Now",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.roboto(
//                     fontStyle: FontStyle.normal,
//                     textStyle: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w700))),
//             onPressed: () => ThrioNavigator.push(
//                 url: RouteList.NATIVE_WEBVIEW,
//                 params: {
//                   "url": itemData["url"],
//                   "orientation": orientation,
//                   "fullscreen": true,
//                   "title": null,
//                   ...params
//                 },
//                 animated: false,
//                 poppedResult: (dynamic value) {
//                   print("popResultValue :$value");
//                 }),
//           ),
//           width: MediaQuery.of(context).size.width));

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
//           imageWrap,
//           Container(
//               child: Column(
//                 children: <Widget>[infoWrap, buttonWrap],
//               ),
//               color: Colors.white,
//               padding: EdgeInsets.all(16.0))
//         ],
//       ),
//     ),
//   );

//   return InkWell(
//       child: widget,
//       onTap: () => ThrioNavigator.push(
//           url: RouteList.APP_GAME, animated: true, params: itemData));
// }
