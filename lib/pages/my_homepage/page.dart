import 'package:flutter/material.dart';
import 'package:substrate_sign_flutter/substrate_sign_flutter.dart';
import 'package:wallet4d/common/chain_substrate.dart';
import 'package:wallet4d/constant/chain_spec.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _phrase = '';

  void _genPhrase() {
    var phrase = randomPhrase(12);
    setState(() {
      _phrase = phrase;
    });
    printAddress();
  }

  void printAddress() {
    var kusamaChain = SubstrateChain.fromName(SubstrateChainName.kusama);
    var address = kusamaChain.getAddressFromSeedPhrase(_phrase);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_phrase',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _genPhrase,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
