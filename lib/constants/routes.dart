import 'package:flutter/widgets.dart';

import '../pages/scan_page.dart';
import '../pages/web_page.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ScanPage.routeName: (_) => const ScanPage(),
  WebPage.routeName: (_) => const WebPage(),
};
