// import 'dart:convert';

import 'package:wallet4d/pages/home/container.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  HomeApp({Key key, this.index, this.params, this.name}) : super(key: key);
  final int index;
  final dynamic params;
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return homePageContainer(context: context, index: index, name: name, params: params);
  }
}
