import 'package:flutter/material.dart';

import 'package:thrio/thrio.dart';

// ignore: implementation_imports
// import 'package:thrio/src/navigator/thrio_navigator_implement.dart';

class NavigatorHome extends StatefulWidget {
  @override
  _NavigatorHomeState createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Something wrong with the pages, please click the button below',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                        padding: const EdgeInsets.all(8),
                        color: Colors.yellow,
                        child: Text(
                          'Restart To Home',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                        onPressed: () {
//                          ThrioNavigator.push(
//                              url: RouteList.APP_HOME, animated: true);
                          ThrioNavigator.pop();
                          // hotRestart();
                        }),
                  ]))));
}
