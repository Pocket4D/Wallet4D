import 'package:flutter/material.dart';

import '../constants/screens.dart';
import '../extensions/extensions.dart';
import '../widgets/gaps.dart';
import 'scan_page.dart';
import 'web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _scan() {
    Navigator.of(context).pushNamed(ScanPage.routeName);
  }

  Widget _urlField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      color: context.theme.dividerColor.withOpacity(0.1),
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          isDense: true,
          hintText: 'Enter website',
        ),
        style: context.textTheme.caption?.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
        onSubmitted: (String url) {
          if (!WebPage.linkRegExp.hasMatch(url)) {
            return;
          }
          Navigator.of(context).pushNamed(
            WebPage.routeName,
            arguments: WebPageArguments(url: url),
          );
        },
      ),
    );
  }

  Widget _dAppGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: 12,
      itemBuilder: (BuildContext c, int index) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.theme.dividerColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Text('DApp_title'),
          ],
        ),
      ),
    );
  }

  Widget _scanButton(BuildContext context) {
    return MaterialButton(
      onPressed: _scan,
      color: context.theme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(Icons.qr_code_scanner, color: Colors.white),
          Gap(10),
          Text(
            'Scan to connect',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet4D'), centerTitle: true),
      backgroundColor: context.theme.cardColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                _urlField(context),
                Expanded(child: _dAppGrid(context)),
              ],
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: context.bottomPadding + 20,
            child: Align(
              alignment: Alignment.center,
              child: _scanButton(context),
            ),
          ),
        ],
      ),
      endDrawer: Container(width: Screens.width * 0.8, color: Colors.white),
      resizeToAvoidBottomInset: false,
    );
  }
}
