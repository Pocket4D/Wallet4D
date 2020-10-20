import 'package:flutter/material.dart';
// import 'package:thrio/thrio.dart';
import 'package:flutter_native_html_view/flutter_native_html_view.dart';
import 'package:wallet4d/pages/base_scaffold.dart';
import 'package:wallet4d/pages/misc/static_data.dart';

class TermOfServicePage extends StatefulWidget {
  TermOfServicePage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;
  @override
  _TermOfServicePageState createState() => _TermOfServicePageState();
}

class _TermOfServicePageState extends State<TermOfServicePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      name: widget.name,
      params: widget.params,
      pageBody: buildPageBody(context),
    );
  }

  Widget buildPageBody(BuildContext context) {
    return FlutterNativeHtmlView(
      htmlData: termOfServiceString,
      onLinkTap: (String url) {
        print(url);
      },
      onError: (String message) {
        print(message);
      },
    );
  }
}
