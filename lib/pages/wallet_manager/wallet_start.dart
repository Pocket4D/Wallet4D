import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thrio/thrio.dart';

import 'package:wallet4d/components/buttons.dart';
import 'package:wallet4d/pages/base_abstract.dart';

import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_gaps_util.dart';

import 'wallet_start.i18n.dart';

class WalletStartPage extends StatefulWidget {
  WalletStartPage({Key key, this.title, this.name}) : super(key: key);
  final String title;
  final String name;
  @override
  _WalletStartPageState createState() => _WalletStartPageState();
}

class _WalletStartPageState extends State<WalletStartPage> with PageWithOverlay {
  @override
  void initState() {
    updateOverlay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;
    final contextHeight = MediaQuery.of(context).size.height > 0
        ? MediaQuery.of(context).size.height
        : 600.toDouble();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: swipper(),
            constraints: BoxConstraints.expand(height: (contextHeight - 120).toDouble()),
          ),
          Column(
            children: [
              KGaps.vGap8,
              primaryButton(
                  buttonText: "Create a new wallet".i18n,
                  onPressed: () => ThrioNavigator.push(url: "/wallet/terms"),
                  contextWidth: contextWidth),
              KGaps.vGap8,
              textButton(
                  buttonText: "I already have a wallet".i18n,
                  onPressed: () => null,
                  contextWidth: contextWidth),
              KGaps.vGap8,
            ],
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget swipper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return FittedBox(
          alignment: Alignment.topCenter,
          child: Container(
            child: Image.network(
              "http://via.placeholder.com/288x188",
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
      itemCount: 3,
      viewportFraction: 1,
      scale: 1,
      loop: true,
      pagination: SwiperPagination(
          builder: const DotSwiperPaginationBuilder(
              size: KDimens.gap_dp8,
              activeSize: KDimens.gap_dp8,
              space: KDimens.gap_dp4,
              color: Colors.black12)),
    );
  }
}
