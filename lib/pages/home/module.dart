// import 'package:wallet4d/configs/constant.dart' show RouteList;
import 'package:wallet4d/pages/home/page.dart';
// import 'package:wallet4d/utils/setStatusBar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:thrio/thrio.dart';

import 'app.dart';

class Module
    with
        ThrioModule,
        ModulePageBuilder,
        ModulePageObserver,
        ModuleRouteTransitionsBuilder,
        NavigatorPageObserver {
  @override
  void onPageBuilderRegister() {
    registerPageBuilder(
      '/home',
      (settings) => HomeApp(index: settings.index, params: settings.params, name: '/home/notify'),
    );
  }

  @override
  void onPageObserverRegister() {
    registerPageObserver(this);
  }

  @override
  void onCreate(RouteSettings routeSettings) {
    print("onCreate");
  }

  @override
  void didAppear(RouteSettings routeSettings) {
    print("didAppear");
  }

  @override
  void didDisappear(RouteSettings routeSettings) {
    print("didDisappear");
  }

  @override
  void willAppear(RouteSettings routeSettings) {
    print("willAppear");
  }

  @override
  void willDisappear(RouteSettings routeSettings) {
    print("willDisappear");
  }
}
