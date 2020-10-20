import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet4d/common/wallet_config.dart';
import 'package:thrio/thrio.dart';
import 'package:wallet4d/pages/wallet_manager/wallet_start.dart';
import 'package:wallet4d/services/wallet_service.dart';
import 'package:wallet4d/utils/jh_storage_util.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title, this.params, this.name}) : super(key: key);
  final String title;
  final dynamic params;
  final String name;
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _isWalletCreated = false;
  @override
  void initState() {
    print("_IndexPageState: $_IndexPageState");
    // TODO: implement initState
    getIfWalletCreated();
    super.initState();
  }

  void getIfWalletCreated() async {
    var walletModel = WalletService.getWallet();
    print("walletModel: $walletModel");
    if (walletModel != null) {
      WalletService.instance.updateWallet();
      setState(() {
        _isWalletCreated = true;
      });
      await ThrioNavigator.push(url: '/home', params: {"from": "/wallet"});
    } else {
      setState(() {
        _isWalletCreated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("_isWalletCreated:$_isWalletCreated");

    return NavigatorPageNotify(
        name: widget.name,
        initialParams: widget.params == null ? null : widget.params,
        onPageNotify: (dynamic params) async {
          print("popped params $params");
          var received = Map<String, dynamic>.from(params);
          if (received["from"] == "/wallet/create") {
            // await ThrioNavigator.remove(url: "/wallet/create");
            getIfWalletCreated();
          }
          if (received["from"] == "/wallet/import") {
            await ThrioNavigator.remove(url: "/wallet/import");
          }
          if (received["from"] == "/home") {
            await ThrioNavigator.remove(url: "/home");
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: _isWalletCreated == false
              ? WalletStartPage(key: Key("walletStartPage"), title: "WalletStartPage")
              : Scaffold(
                  body: Center(
                    child: Text("Starting..."),
                  ),
                ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
