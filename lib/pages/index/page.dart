import 'package:flutter/material.dart';
import 'package:wallet4d/common/wallet_config.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_start.dart';
import 'package:wallet4d/utils/jh_storage_util.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _isWalletCreated = false;
  @override
  void initState() {
    // TODO: implement initState
    getIfWalletCreated();
    super.initState();
  }

  void getIfWalletCreated() {
    var walletModel = JhStorageUtils.getModelWithKey(kWalletDefaultStorageKey);
    if (walletModel != null) {
      setState(() {
        _isWalletCreated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isWalletCreated == false) {
      return WalletStartPage(key: Key("walletStartPage"), title: "WalletStartPage");
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Now we have a wallet',
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
