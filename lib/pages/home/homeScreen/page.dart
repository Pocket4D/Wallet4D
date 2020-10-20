import 'dart:convert';

// import 'package:wallet4d/beans/CardList.dart';
// import 'package:wallet4d/configs/constant.dart';

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:wallet4d/components/antdIcons.dart';
import 'package:wallet4d/pages/home/homeScreen/widgets/dropdown_menu.dart';
import 'package:wallet4d/utils/k_dimens_util.dart';
import 'package:wallet4d/utils/k_gaps_util.dart';
import 'package:wallet4d/utils/k_theme_util.dart';
import 'package:thrio/thrio.dart';

import './widgets/searchWidget.dart';
// import 'adCard.dart';
// import 'aricleCard.dart';
// import 'gameCard.dart';

enum Popups { addToken, qrScanner, sendReceive }

class HomeScreen extends StatefulWidget {
  final String text;
  final Function fetchCardList;
  final Function fetchGameDetail;

  HomeScreen({this.text, this.fetchCardList, this.fetchGameDetail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  // List<CardItem> _cardList;
  Map<String, GlobalKey<State<HomeScreen>>> _cardKeys;
  int _page;
  int _pages;
  int _totals;
  int _pageSize;
  int _currentCardIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInOut;
  bool loading = false;

  static final PageController _pageController =
      PageController(viewportFraction: 0.875, keepPage: false);

  @override
  bool get wantKeepAlive => true;

  // _fetchCardList() async {
  //   if (_cardList == null) {
  //     setState(() {
  //       loading = true;
  //     });
  //     var cardList = await widget.fetchCardList();
  //     Map<String, dynamic> decoded = jsonDecode(cardList);
  //     var listClass = CardList.fromJson(decoded);
  //     List<CardItem> _list = listClass.cardItem;
  //     var _cardKeysArray = _list.map((CardItem cardItem) => MapEntry(
  //         '${cardItem.cardid.toString()}', GlobalKey<State<HomeScreen>>()));
  //     Map<String, GlobalKey<State<HomeScreen>>> _keys = Map();
  //     _keys.addEntries(_cardKeysArray.toList());

  //     setState(() {
  //       _cardList = _list;
  //       _cardKeys = _keys;
  //       _page = listClass.page;
  //       _pages = listClass.pages;
  //       _totals = listClass.totals;
  //       _pageSize = listClass.pageSize;
  //       loading = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    // _fetchCardList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        key: Key('HomeSceen'),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: _currentCardIndex != 0
                        ? FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              _pageController.animateToPage(0,
                                  duration: _kDuration, curve: _kCurve);
                            },
                            backgroundColor: Colors.black38,
                            tooltip: 'Back to first page',
                            child: Icon(Icons.first_page, color: Colours.line),
                          )
                        : null)),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                },
                backgroundColor: Colors.black38,
                tooltip: 'Switch Gradient Effect',
                // child: Icon(_cardList == null ||
                //         (_cardList != null &&
                //             _currentCardIndex == _cardList.length - 1)
                //     ? Icons.all_inclusive
                //     : Icons.arrow_forward
                child: Icon(
                  Icons.arrow_forward,
                  color: Colours.line,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: KDimens.gap_dp16,
                      height: KDimens.gap_dp16,
                      margin: EdgeInsets.all(KDimens.gap_dp8),
                      // color: KColor.appbarEndColor,
                    ),
                    searchWidget(),
                    dropDownMenu<Popups>(
                        onSelected: (Popups result) {
                          print(result);
                          if (result == Popups.qrScanner) {
                            ThrioNavigator.push(url: '/qrPage', params: {"from": '/home'});
                          }
                        },
                        items: <PopupMenuEntry<Popups>>[
                          PopupMenuItem<Popups>(
                            value: Popups.addToken,
                            child: popUpMenuWidget(
                                icon: Icon(AntdIcons.accountBook), text: Text("Add Token")),
                          ),
                          PopupMenuItem<Popups>(
                            value: Popups.qrScanner,
                            child: popUpMenuWidget(
                                icon: Icon(
                                  AntdIcons.scan,
                                ),
                                text: Text("QR Scanner")),
                          ),
                          PopupMenuItem<Popups>(
                              value: Popups.sendReceive,
                              child: popUpMenuWidget(
                                  icon: Icon(
                                    AntdIcons.interation,
                                  ),
                                  text: Text("Send/Receive")))
                        ])
                  ]),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 0),
                    child: loading == false
                        ? PageView.builder(
                            pageSnapping: true,
                            physics: BouncingScrollPhysics(),
                            //itemCount: _cardList != null ? _cardList.length : 0,
                            itemCount: 2,
                            controller: _pageController,
                            onPageChanged: (int cardIndex) {
                              setState(() {
                                _currentCardIndex = cardIndex;
                              });
                            },
                            itemBuilder: (context, index) {
                              // print("index: $index");
                              // var cardItem = _cardList[index];

                              // Widget itemWidget;
                              // if (cardItem != null) {
                              //   if (cardItem.type == 1) {
                              //     // itemWidget = gameCard(
                              //     //     cardItem,
                              //     //     context,
                              //     //     _cardKeys[
                              //     //         "${cardItem.cardid.toString()}"],
                              //     //     params: {
                              //     //       // "from": RouteList.APP_HOME,
                              //     //       // "notify": NotifyList.APP_HOME
                              //     //     });
                              //   } else if (cardItem.type == 2) {
                              //     // itemWidget = articleCard(
                              //     //     cardItem,
                              //     //     context,
                              //     //     _cardKeys[
                              //     //         "${cardItem.cardid.toString()}"],
                              //     //     params: {
                              //     //       // "from": RouteList.APP_HOME,
                              //     //       // "notify": NotifyList.APP_HOME
                              //     //     });
                              //   } else if (cardItem.type == 3) {
                              //     // itemWidget = adCard(
                              //     //     cardItem,
                              //     //     context,
                              //     //     _cardKeys[
                              //     //         "${cardItem.cardid.toString()}"],
                              //     //     params: {
                              //     //       // "from": RouteList.APP_HOME,
                              //     //       // "notify": NotifyList.APP_HOME
                              //     //     });
                              //   }
                              // } else {
                              //   print("cardItem is null");
                              //   itemWidget = defaultEmptyCard;
                              // }
                              Widget itemWidget = defaultEmptyCard;
                              return Container(
                                  // key: cardItem != null
                                  //     ? _cardKeys["${cardItem.cardid.toString()}"]
                                  //     : Key("cardItem"),
                                  key: Key("cardItem"),
                                  child: itemWidget,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.0,
                                    horizontal: 0.0,
                                  ),
                                  margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: KColor.kWeiXinThemeColor,
                                  ));
                            })
                        : defaultEmptyCard),
              )
            ])));
  }

  Widget defaultEmptyCard = Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      color: Colors.transparent,
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        //抗锯齿
        child: SkeletonAnimation(
            child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 0.0,
          ),
          margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
          decoration: BoxDecoration(
              color: KColor.kWeiXinThemeColor, borderRadius: BorderRadius.circular(10)),
        )),
      ));

  Widget popUpMenuWidget({Icon icon, Text text}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [icon, KGaps.hGap16, text]);
  }
}
