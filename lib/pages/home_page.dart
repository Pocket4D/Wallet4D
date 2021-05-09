import 'package:flutter/material.dart';

import '../constants/screens.dart';
import 'web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _scan() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet4D'), centerTitle: true),
      body: const WebPage(
        url: 'https://github.com/Pocket4D/Wallet4D',
        withAppBar: false,
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
