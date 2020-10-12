import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class JhScreenUtils {
  static init(BuildContext context) {
    //假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
  }

  static setWidth(double width) {
    ScreenUtil().setWidth(width);
  }

  static setHeight(double height) {
    ScreenUtil().setHeight(height);
  }

  static setSp(num fontSize) {
    ScreenUtil().setSp(fontSize);
  }

  // static double get screenWidth => ScreenUtil.screenWidth;
  //
  // static double get screenHeight => ScreenUtil.screenHeight;

  static double get screenWidthPx => ScreenUtil().screenWidthPx;

  static double get screenHeightPx => ScreenUtil().screenHeightPx;

  static double get statusBarHeight => ScreenUtil().statusBarHeight;

  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  //系统方法获取

  static double get screenWidth {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  static double get screenHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class JhScreen {
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

/*
    ScreenUtil().setWidth(540)  (sdk>=2.6 : 540.w) //Adapted to screen width
    ScreenUtil().setHeight(200) (sdk>=2.6 : 200.h) //Adapted to screen height
    ScreenUtil().setSp(24)      (sdk>=2.6 : 24.sp)  //Adapter font
    ScreenUtil().setSp(24, allowFontScalingSelf: true)  (sdk>=2.6 : 24.ssp) //Adapter font(fonts will scale to respect Text Size accessibility settings)
    ScreenUtil().setSp(24, allowFontScalingSelf: false)  (sdk>=2.6 : 24.nsp) //Adapter font(fonts will not scale to respect Text Size accessibility settings)

    ScreenUtil().pixelRatio       //Device pixel density
    ScreenUtil().screenWidth   (sdk>=2.6 : 1.wp)    //Device width
    ScreenUtil().screenHeight  (sdk>=2.6 : 1.hp)    //Device height
    ScreenUtil().bottomBarHeight  //Bottom safe zone distance, suitable for buttons with full screen
    ScreenUtil().statusBarHeight  //Status bar height , Notch will be higher Unit px
    ScreenUtil().textScaleFactor  //System font scaling factor

    ScreenUtil().scaleWidth //Ratio of actual width dp to design draft px
    ScreenUtil().scaleHeight //Ratio of actual height dp to design draft px

    0.2.wp  //0.2 times the screen width
    0.5.hp  //50% of screen height
*/
