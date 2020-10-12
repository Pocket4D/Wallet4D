import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';

Widget primaryButton({String buttonText, void Function() onPressed, double contextWidth}) {
  return Container(
      height: 48,
      padding: EdgeInsets.only(left: KDimens.gap_dp16, right: KDimens.gap_dp16),
      child: SizedBox(
          child: FlatButton(
            textTheme: ButtonTextTheme.primary,
            color: KColor.kWeiXinThemeColor,
            child: Text(buttonText,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    textStyle:
                        TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700))),
            onPressed: onPressed,
          ),
          width: contextWidth));
}

Widget textButton({String buttonText, void Function() onPressed, double contextWidth}) {
  return Container(
      height: 48,
      padding: EdgeInsets.only(left: KDimens.gap_dp16, right: KDimens.gap_dp16),
      child: SizedBox(
          child: TextButton(
            child: Text(buttonText,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: KColor.kWeiXinThemeColor,
                        fontWeight: FontWeight.w700))),
            onPressed: onPressed,
          ),
          width: contextWidth));
}
