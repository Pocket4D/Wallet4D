import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/components/custom_navigator.dart';

class BaseScaffold extends StatefulWidget {
  final String name;
  final dynamic params;
  final NavigatorParamsCallback onPageNotify;
  final Future<bool> Function() onWillPop;
  final Widget pageBody;
  final Widget pageStickBottom;
  final bool showNavigator;
  BaseScaffold(
      {this.name,
      this.params,
      this.onPageNotify,
      this.onWillPop,
      this.pageBody,
      this.pageStickBottom,
      this.showNavigator = true});
  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    return NavigatorPageNotify(
        name: widget.name,
        initialParams: widget.params == null ? null : widget.params,
        onPageNotify: widget.onPageNotify,
        child: WillPopScope(
            onWillPop: widget.onWillPop,
            child: Scaffold(
                key: _scaffoldKey,
                body: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: Stack(
                      children: <Widget>[
                        widget.pageBody,
                        widget.showNavigator
                            ? customNavigator(width: windowWidth, iconSize: 24.0, elevation: 0.0)
                            : Container(height: 0, width: 0),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: widget.pageStickBottom,
                        )
                      ],
                    )))));
  }
}
