///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2021-05-10 23:00
///
import 'package:flutter/widgets.dart';

import '../pages/web_page.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  WebPage.routeName: (_) => const WebPage(),
};
