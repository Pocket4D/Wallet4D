import 'package:flutter/material.dart';
// import 'package:thrio/thrio.dart';
import 'package:flutter_native_html_view/flutter_native_html_view.dart';
import 'package:wallet4d/pages/base_scaffold.dart';
import 'package:wallet4d/pages/misc/static_data.dart';

class PrivacyPolicyPage extends StatefulWidget {
  PrivacyPolicyPage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
      htmlData: privacyPolicyString,
      onLinkTap: (String url) {
        print(url);
      },
      onError: (String message) {
        print(message);
      },
    );
  }
}
