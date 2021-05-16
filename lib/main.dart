import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/constants/routes.dart';
import 'src/extensions/extensions.dart';
import 'src/pages/home_page.dart';

void main() {
  runZonedGuarded(
    () async {
      await Hive.initFlutter();

      runApp(const WalletApp());
    },
    (error, stackTrace) {
      'Error caught in runZonedGuarded: $error'.logE(stackTrace: stackTrace);
    },
  );
  if (Platform.isAndroid) {
    WebView.platform = SurfaceAndroidWebView();
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class WalletApp extends StatelessWidget {
  const WalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.localizations.wallet4D,
      theme: ThemeData(primarySwatch: const Color(0xff0096A6).swatch),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
      routes: routes,
    );
  }
}
