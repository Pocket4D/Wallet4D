import 'dart:io';

// import 'package:wallet4d/beans/LoginInfo.dart';
// import 'package:wallet4d/components/antdIcons.dart';
// import 'package:wallet4d/configs/constant.dart';
import 'package:wallet4d/components/antdIcons.dart';
import 'package:wallet4d/components/overlay_modal.dart';
import 'package:wallet4d/pages/home/myScreen/widgets/commonMenu.dart';
import 'package:wallet4d/pages/home/myScreen/widgets/pageTopWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/services/wallet_service.dart';
import 'package:wallet4d/utils/k_gaps_util.dart';

class MyScreen extends StatefulWidget {
  // MyScreen({this.loginInfo, this.updateLoginInfo});

  // final LoginInfo loginInfo;
  // final Function updateLoginInfo;

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    // getUserInfo();
    // widget.updateLoginInfo();
    setStatusBar();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    // print("app/myscreen loginInfo: ${widget.loginInfo}");
    var windowWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        key: Key('MyScreen'),
        body: OverlayModal(
            showOverlay: false,
            child: Stack(children: <Widget>[
              SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            pageTopWrapper(
                                width: windowWidth, walletName: WalletService.instance.walletName),
                            Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(color: Colors.transparent, height: 4)),
                            commonMenu(Icon(AntdIcons.scan), "QR Scanner", () async {
                              // ThrioNavigator.push(
                              //     url: RouteList.APP_QRPAGE, params: {}, animated: true);
                              await ThrioNavigator.push(url: '/qrPage', params: {"from": '/home'});
                            }),
                            commonMenu(Icon(AntdIcons.setting), "Settings", () {
                              // ThrioNavigator.push(url: RouteList.APP_SETTINGPAGE, animated: true);
                              ThrioNavigator.push(url: '/p4d', params: {
                                "endpoint": "http://122.248.226.210:3001/api/v1/bundled"
                              });
                            }),
                            KGaps.vGap8,
                            commonMenu(Icon(AntdIcons.setting), "Destroy Wallet", () async {
                              // ThrioNavigator.push(url: RouteList.APP_SETTINGPAGE, animated: true);
                              var result = await WalletService.instance.destroyWallet();
                              if (result) {
                                await ThrioNavigator.push(
                                    url: '/wallet', params: {"from": "/home"});
                              }
                            }),
                            KGaps.vGap8
                          ]))),
              // customNavigator(),
            ])));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
}
