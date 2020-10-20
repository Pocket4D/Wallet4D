// import 'package:wallet4d/configs/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';

Widget searchWidget() {
  return Expanded(
      child: Container(
    margin: const EdgeInsets.only(
      top: KDimens.gap_dp8,
      bottom: KDimens.gap_dp8,
    ),
    padding: EdgeInsets.only(
        top: KDimens.gap_dp8,
        bottom: KDimens.gap_dp8,
        left: KDimens.gap_dp16,
        right: KDimens.gap_dp16),
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.grey[300]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Icon(Icons.search),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
        ),
        Expanded(
            child: InkWell(
          child: Container(
              child: Text(
            "Search Token/Dapp",
            textAlign: TextAlign.left,
          )),
          onTap: () {
            // ThrioNavigator.push(url: RouteList.APP_SEARCH, animated: true);
          },
        )),
        Padding(
          padding: EdgeInsets.only(left: 8),
        ),
        // Container(
        //   child: Text("link"),
        // )
      ],
    ),
  ));
}
