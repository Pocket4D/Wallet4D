import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../extensions/extensions.dart';
import 'web_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  static const String routeName = 'wallet4d://scan';

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey _qrViewKey = GlobalKey();
  QRViewController? _controller;

  QRViewController get controller => _controller!;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _initializeController(QRViewController qrViewController) {
    _controller = qrViewController;
    controller.scannedDataStream.listen((result) async {
      result.code.logD();
      if (WebPage.linkRegExp.hasMatch(result.code)) {
        await controller.pauseCamera();
        final _url = WebPage.linkRegExp.allMatches(result.code).first.group(0).toString();
        Navigator.of(context).pushNamed(
          WebPage.routeName,
          arguments: WebPageArguments(url: _url),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Center(child: Text('Initializing scan view...')),
          Positioned.fill(
            child: QRView(
              key: _qrViewKey,
              onQRViewCreated: _initializeController,
            ),
          ),
        ],
      ),
    );
  }
}
