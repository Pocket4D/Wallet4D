import 'dart:io';

import 'package:wallet4d/components/antdIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/qrcode.dart';
import 'package:thrio/thrio.dart';

class QRPage extends StatefulWidget {
  QRPage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  QRCaptureController _captureController = QRCaptureController();

  bool _isTorchOn = false;

  @override
  void initState() {
    setStatusBar();
    super.initState();

    _captureController.onCapture((data) async {
      print("qrScanner result: $data");
      // if (data.startsWith("http://") || data.startsWith("https://")) {
      // await ThrioNavigator.push(
      //     url: RouteList.NATIVE_WEBVIEW,
      //     params: {
      //       "url": data,
      //       "fullscreen": false,
      //       "orientation": "vertical",
      //       "from": RouteList.APP_QRPAGE,
      //       "notify": NotifyList.APP_QRPAGE
      //     },
      //     animated: true,
      //     poppedResult: (result) async {
      //       print("poppedResult: $result");
      //       await ThrioNavigator.pop(animated: false);
      //     });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRCaptureView(controller: _captureController),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(margin: EdgeInsets.only(bottom: 64), child: _buildToolBar()),
          )
        ],
      ),
    );
  }

  Widget _buildToolBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // PhysicalModel(
        //   borderRadius: BorderRadius.circular(24.0),
        //   clipBehavior: Clip.antiAlias,
        //   elevation: 4,
        //   child: IconButton(
        //     iconSize: 24.0,
        //     color: Colors.deepPurple,
        //     icon: Icon(AntdIcons.pause),
        //     onPressed: () {
        //       _captureController.pause();
        //     },
        //   ),
        //   color: Colors.white,
        // ),
        // Padding(
        //   padding: EdgeInsets.only(left: 32),
        // ),
        PhysicalModel(
          borderRadius: BorderRadius.circular(24.0),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: IconButton(
            iconSize: 24.0,
            color: _isTorchOn ? Colors.white : Colors.deepPurple,
            icon: Icon(AntdIcons.bulb),
            onPressed: () {
              if (_isTorchOn) {
                _captureController.torchMode = CaptureTorchMode.off;
              } else {
                _captureController.torchMode = CaptureTorchMode.on;
              }
              setState(() {
                _isTorchOn = !_isTorchOn;
              });
            },
          ),
          color: _isTorchOn ? Colors.deepPurple : Colors.white,
        ),
        // Padding(
        //   padding: EdgeInsets.only(right: 32),
        // ),
        // PhysicalModel(
        //   borderRadius: BorderRadius.circular(24.0),
        //   clipBehavior: Clip.antiAlias,
        //   elevation: 4,
        //   child: IconButton(
        //     iconSize: 24.0,
        //     color: Colors.deepPurple,
        //     icon: Icon(AntdIcons.playCircle),
        //     onPressed: () {
        //       _captureController.resume();
        //     },
        //   ),
        //   color: Colors.white,
        // ),
      ],
    );
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
}
