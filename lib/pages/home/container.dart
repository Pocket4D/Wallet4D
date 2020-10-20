import 'package:wallet4d/pages/home/page.dart';
// import 'package:deplay_flutter_app/services/api.dart' as api;
import 'package:dva_dart/dva_dart.dart' as Dva;
import 'package:dva_flutter/connector.dart';
import 'package:flutter/material.dart';

Widget homePageContainer({BuildContext context, int index, String name, dynamic params}) {
  return DvaConnector(
      context: context,
      key: Key('homePageContainer'),
      listenTo: ['homeModel'],
      builder: (BuildContext context, DvaModels models, dispatch) {
        return Home(
          key: Key("HomePage"),
          index: index,
          name: name,
          params: params,
        );
      });
}
