import 'package:dva_flutter/connector.dart';
import 'package:dva_dart/dva_dart.dart' as Dva;
import 'package:flutter/material.dart';

import 'page.dart';

Widget myPageContainer({BuildContext context}) {
  return DvaConnector(
      context: context,
      key: Key('myPageContainer'),
      listenTo: ['homeModel'],
      builder: (BuildContext context, DvaModels models, dispatch) {
        return MyScreen();
      });
}
