import 'package:flutter/material.dart';

import '../constants/screens.dart';
import '../extensions/extensions.dart';
import 'web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _scan() {}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet4D'), centerTitle: true),
      backgroundColor: context.theme.cardColor,
      body: Column(
        children: <Widget>[
          _urlField(context),
          Expanded(child: _dAppGrid(context)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'Scan',
        child: const Icon(Icons.qr_code_scanner),
      ),
      endDrawer: Container(width: Screens.width * 0.8, color: Colors.white),
    );
  }
}
