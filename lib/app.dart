import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dva_dart/dva_dart.dart';
import 'package:dva_flutter/dva_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket4d/pocket4d.dart' hide store;
import 'package:wallet4d/components/NavigatorHome.dart';
import 'package:wallet4d/store.dart';
import 'package:thrio/thrio.dart' hide NavigatorHome;
import 'package:wallet4d/services/wallet_service.dart';
import 'package:wallet4d/utils/k_localization_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'routes/module.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  WalletService();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  P4DEngine.start();
  runApp(GlobalStore());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class GlobalStore extends StatefulWidget {
  final String entrypoint;

  const GlobalStore({this.entrypoint = 'main'});

  @override
  _GlobalStoreState createState() => _GlobalStoreState();
}

class _GlobalStoreState extends State<GlobalStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DvaProvider<DvaStore>(
      child: MainApp(
        entrypoint: widget.entrypoint,
      ),
      store: store,
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key key, String entrypoint = 'main'})
      : _entrypoint = entrypoint,
        super(key: key);

  final String _entrypoint;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with ThrioModule {
  @override
  void initState() {
    super.initState();

    registerModule(this);
    initModule();
  }

  @override
  void onModuleRegister() {
    registerModule(routes.Module());
  }

  @override
  void onModuleInit() {
    // navigatorLogging = true;
  }

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
        child: MaterialApp(
          builder: ThrioNavigator.builder(entrypoint: widget._entrypoint),
          navigatorObservers: [],
          home: I18n(child: NavigatorHome()),
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              },
            ),

            /// 主色，决定导航栏颜色
            primaryColor: KColor.kWeiXinThemeColor,

            /// 次级色，决定大多数Widget的颜色，如进度条、开关等。
            accentColor: KColor.kWeiXinTitleColor,

            primaryIconTheme: IconThemeData(color: KColor.kWeiXinTitleColor),
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            const FallbackCupertinoLocalisationsDelegate()
          ],
          supportedLocales: [Locale('zh', 'CN'), Locale('en', 'US')],
        ),
      );
}
