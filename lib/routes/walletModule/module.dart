import 'package:flutter/widgets.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/pages/index/page.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_legal_notice.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_start.dart';
// import 'package:wallet4d/pages/my_homepage/page.dart';

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
      '/wallet',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return IndexPage(
          key: Key("indexPage"),
          title: "IndexPage",
        );
      },
    );

    registerPageBuilder(
      '/wallet/start',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return WalletStartPage(
          key: Key("walletStartPage"),
          title: "WalletStartPage",
        );
      },
    );
    registerPageBuilder(
      '/wallet/terms',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return WalletLegalNoticePage(
          key: Key("walletLegalNoticePage"),
          title: "WalletLegalNoticePage",
          params: settings.params,
          name: "WalletLegalNoticePage",
        );
      },
    );
  }

  @override
  void onPageObserverRegister() {
    registerPageObserver(this);
  }

  @override
  void onRouteTransitionsBuilderRegister() {
    // registerRouteTransitionsBuilder(
    //     '\/biz1\/flutter[0-9]*',
    //     (
    //       context,
    //       animation,
    //       secondaryAnimation,
    //       child,
    //     ) =>
    //         SlideTransition(
    //           transformHitTests: false,
    //           position: Tween<Offset>(
    //             begin: const Offset(0, -1),
    //             end: Offset.zero,
    //           ).animate(animation),
    //           child: SlideTransition(
    //             position: Tween<Offset>(
    //               begin: Offset.zero,
    //               end: const Offset(0, 1),
    //             ).animate(secondaryAnimation),
    //             child: child,
    //           ),
    //         ));
  }

  @override
  void onCreate(RouteSettings routeSettings) {}

  @override
  void didAppear(RouteSettings routeSettings) {}

  @override
  void didDisappear(RouteSettings routeSettings) {}

  @override
  void willAppear(RouteSettings routeSettings) {}

  @override
  void willDisappear(RouteSettings routeSettings) {}
}
