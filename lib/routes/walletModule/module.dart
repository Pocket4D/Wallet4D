import 'package:flutter/widgets.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/pages/home/app.dart';
import 'package:wallet4d/pages/index/page.dart';
import 'package:wallet4d/pages/misc/privacy_policy.dart';
import 'package:wallet4d/pages/misc/qr_page_2.dart';
import 'package:wallet4d/pages/misc/term_of_service.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_create.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_import.dart';
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
          params: settings.params,
          name: "/wallet/notify",
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
          params: settings.params,
          name: "/wallet/notify",
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
          name: "/wallet/terms/notify",
        );
      },
    );
    registerPageBuilder(
      '/wallet/create',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return WalletCreatePage(
          key: Key("walletCreatePage"),
          title: "walletCreatePage",
          params: settings.params,
          name: "/wallet/create/notify",
        );
      },
    );
    registerPageBuilder(
      '/wallet/import',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return WalletImportPage(
          key: Key("walletImportPage"),
          title: "walletImportPage",
          params: settings.params,
          name: "/wallet/import/notify",
        );
      },
    );
    registerPageBuilder(
      '/privacy_policy',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return PrivacyPolicyPage(
          key: Key("privacyPolicyPage"),
          title: "privacyPolicyPage",
          params: settings.params,
          name: "/privacy_policy/notify",
        );
      },
    );

    registerPageBuilder(
      '/term_of_service',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return TermOfServicePage(
          key: Key("termOfServicePage"),
          title: "termOfServicePage",
          params: settings.params,
          name: "/term_of_service/notify",
        );
      },
    );

    registerPageBuilder(
      '/home',
      (settings) {
        // var params = Map<String, dynamic>.from(settings.params);
        return HomeApp(
          key: Key("homeApp"),
          params: settings.params,
          name: "/homeApp/notify",
        );
      },
    );

    registerPageBuilder('/qrPage', (settings) {
      return QRPage(
        key: Key('prPage'),
        title: "prPage",
        params: settings.params,
        name: "/prPage/notify",
      );
    });
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
