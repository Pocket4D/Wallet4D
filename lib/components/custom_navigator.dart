import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';

Widget customNavigator(
    {double width,
    EdgeInsets margin = const EdgeInsets.only(top: 32),
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 0),
    double iconSize = KDimens.gap_dp16,
    Color iconColor = KColor.kWeiXinThemeColor,
    Color backgroundColor,
    Icon icon = const Icon(
      Icons.arrow_back,
    ),
    double elevation = KDimens.gap_dp4}) {
  return SizedBox(
    child: Container(
      margin: margin,
      padding: padding,
      // color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PhysicalModel(
            // borderRadius: BorderRadius.circular(iconSize ?? 24.0),
            clipBehavior: Clip.antiAlias,
            elevation: elevation,
            child: IconButton(
              iconSize: iconSize,
              color: iconColor,
              icon: icon,
              onPressed: () {
                ThrioNavigator.pop(animated: true);
              },
            ),
            color: backgroundColor ?? Colors.transparent,
          )
        ],
      ),
    ),
  );
}
