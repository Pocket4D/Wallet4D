import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    Key? key,
    required this.url,
    this.title = 'Wallet4D',
    this.withAppBar = true,
  }) : super(key: key);

  final String url;
  final String title;
  final bool withAppBar;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late String url = widget.url;
  late String title = widget.title;

  @override
  Widget build(BuildContext context) {
    Widget child = WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onProgress: (int progress) => print(progress),
    );
    if (widget.withAppBar) {
      child = Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: child,
      );
    }
    return child;
  }
}
