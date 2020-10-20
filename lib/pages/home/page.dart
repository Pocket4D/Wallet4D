import 'dart:convert';
import 'dart:io';

// import 'package:wallet4d/beans/LoginInfo.dart';
import 'package:wallet4d/components/antdIcons.dart';
// import 'package:wallet4d/configs/constant.dart';
// import 'package:wallet4d/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/utils/k_theme_util.dart';

import 'abstracts.dart';
// import 'contentScreen/page.dart';
import 'homeScreen/page.dart';
import 'myScreen/app.dart';

class Home extends StatefulWidget {
  Home({Key key, this.index, this.params, this.name}) : super(key: key);

  final int index;
  final dynamic params;
  final String name;

  @override
  _HomeState createState() => _HomeState(index, params);
}

class _HomeState extends State<Home> with HybridMessageHandler, AutomaticKeepAliveClientMixin {
  final _bottomNavigationColor = Colors.black45;
  final _bottomChosenColor = KColor.kWeiXinThemeColor;

  int _index = 0;
  dynamic _params;

  int _currentIndex = 0;
  List<Widget> list = List();

  _HomeState(
    this._index,
    this._params,
  );

  PageController _pageController;

  DateTime _lastPressedAt;

  @override
  void initState() {
    setStatusBar();
    _pageController = PageController();
    list
      ..add(HomeScreen())
      // ..add(ContentScreen(
      //     searchArticleList: widget.searchArticleList,
      //     searchGameList: widget.searchGameList,
      //     openWebview: widget.openWebview,
      //     tagGameList: widget.tagGameList))
      ..add(MyScreenApp());

    super.initState(); //无名无参需要调用
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    cancelToast();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigatorPageNotify(
        name: widget.name,
        initialParams: widget.params == null ? null : widget.params,
        onPageNotify: (params) {
          ThrioLogger.v('app/home receive notify:$params');
          print(params.runtimeType.toString());
          if (params != null && params.runtimeType.toString() != "String") {
            Map<String, dynamic> paramsMap = Map<String, dynamic>.from(params);

            if (paramsMap["from"] == '/wallet') {
              ThrioNavigator.remove(url: '/wallet', animated: false);
            }
          }
        },
        child: WillPopScope(
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressedAt = DateTime.now();
                showColoredToast("Press again will exit");
                return false;
              }
              return true;
            },
            child: SafeArea(
                top: false,
                child: Scaffold(
                  //脚手架
                  body: AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: list,
                      )),

                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: _bottomNavBarClick,

                    items: [
                      BottomNavigationBarItem(
                          //导航栏子按钮
                          icon: Icon(
                            AntdIcons.home,
                            color: _currentIndex == 0 ? _bottomChosenColor : _bottomNavigationColor,
                          ),
                          label: 'Home'),
                      BottomNavigationBarItem(
                        icon: Icon(
                          AntdIcons.user,
                          color: _currentIndex == 1 ? _bottomChosenColor : _bottomNavigationColor,
                        ),
                        label: 'My',
                      ),
                    ],
                    type: BottomNavigationBarType.fixed, //导航栏类型
                  ),
                ))));
  }

  void _bottomNavBarClick(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(_currentIndex);
  }

  void showColoredToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white);
  }

  void cancelToast() {
    Fluttertoast.cancel();
  }

  @override
  void onMessage(Map<String, dynamic> message) {
    print(message.toString());
  }

  setStatusBar() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
          //黑色沉浸式状态栏。基于SystemUiOverlayStyle.dark修改了statusBarColor
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
