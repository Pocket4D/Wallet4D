// import 'dart:convert';
// import 'package:deplay_flutter_app/beans/ArticleCard.dart';
// import 'package:deplay_flutter_app/beans/GameCard.dart';
// import 'package:deplay_flutter_app/configs/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// import 'package:deplay_flutter_app/beans/ArticleList.dart';
// import 'package:deplay_flutter_app/beans/GameList.dart';
// import 'package:deplay_flutter_app/components/tabListView.dart';
// import 'package:deplay_flutter_app/pages/home/homeScreen/widgets/searchWidget.dart';
// import 'package:deplay_flutter_app/pages/search/widgets/articleListView.dart';
// import 'package:deplay_flutter_app/pages/search/widgets/gameListView.dart';
// import 'package:deplay_flutter_app/services/api.dart';
// import 'package:thrio/thrio.dart';

// // import 'package:thrio/thrio.dart';

// class ContentScreen extends StatefulWidget {
//   ContentScreen(
//       {Key key,
//       this.searchGameList,
//       this.searchArticleList,
//       this.tagGameList,
//       this.openWebview})
//       : super(key: key);
//   final Function searchGameList;
//   final Function searchArticleList;
//   final Function tagGameList;
//   final Function openWebview;

//   @override
//   _ContentScreenState createState() => _ContentScreenState();
// }

// class _ContentScreenState extends State<ContentScreen>
//     with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
//   List<GameCard> _gameCardList;
//   List<ArticleCard> _articleCardList;
//   int _currentGamePage = 1;
//   int _currentArtPage = 1;
//   TabController _tabController;
//   RefreshController _refreshController = RefreshController();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     // getTagList(1);
//     getGameList(1);
//     getArticleList(1);
//     _tabController = TabController(
//         vsync: this, // 动画效果的异步处理
//         length: 2 // tab 个数
//         );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _refreshController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   getTagGameList(int tagid) async {
//     String gameListOfTag = await widget.tagGameList(tagid);
//     Map<String, dynamic> gameListMap = jsonDecode(gameListOfTag);
//     var gameList = GameList.fromJson(gameListMap);
//     var currentList = _gameCardList;
//     currentList.addAll(gameList.list);
//     setState(() {
//       _gameCardList = currentList;
//     });
//   }

//   getGameList(int page) async {
//     try {
//       String gameListOfSearch =
//           await searchGameList('', page: page, maxcount: 20);
//       Map<String, dynamic> gameListMap = jsonDecode(gameListOfSearch);
//       var gameList = GameList.fromJson(gameListMap);

//       var currentList = _gameCardList ?? [];
//       currentList.addAll(gameList.list);
//       setState(() {
//         _gameCardList = currentList;
//       });
//     } catch (e) {
//       showColoredToast("Network fail, Retry later");
//       setState(() {
//         _gameCardList = [];
//       });
//     }
//   }

//   getArticleList(int page) async {
//     try {
//       String articleListOfSearch =
//           await searchArticleList('', page: page, maxcount: 20);
//       Map<String, dynamic> articleListMap = jsonDecode(articleListOfSearch);
//       var articleList = ArticleList.fromJson(articleListMap);
//       var currentList = _articleCardList ?? [];
//       currentList.addAll(articleList.list);

//       setState(() {
//         _articleCardList = currentList;
//       });
//     } catch (e) {
//       showColoredToast("Network fail, Retry later");
//       setState(() {
//         _articleCardList = [];
//       });
//     }
//   }

//   @override
//   // ignore: must_call_super
//   Widget build(BuildContext context) {
//     super.build(context);

//     // TODO: implement build
//     return Scaffold(
//         key: Key('ContentScreen'),
//         body: SafeArea(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//               searchWidget(),
//               // testScript(),
//               Expanded(
//                   child: Container(
//                       margin: EdgeInsets.only(top: 0),
//                       height: MediaQuery.of(context).size.height - 64,
//                       child: _gameCardList != null
//                           ? tabListView(tabController: _tabController, tabs: <
//                               Tab>[
//                               // Tab(text: 'All'),
//                               Tab(text: 'Games'),
//                               Tab(text: 'Articles'),
//                             ], tabBarViews: [
//                               // Text("This is call Tab View"),
//                               _gameCardList != null && _gameCardList.length > 0
//                                   ? RefreshConfiguration(
//                                       enableBallisticLoad: false,
//                                       footerTriggerDistance: -80,
//                                       maxUnderScrollExtent: 60,
//                                       child: SmartRefresher(
//                                           controller: _refreshController,
//                                           enablePullUp: true,
//                                           footer: ClassicFooter(
//                                             loadStyle:
//                                                 LoadStyle.ShowWhenLoading,
//                                           ),
//                                           onLoading: () async {
//                                             print("onLoading!!");
//                                             try {
//                                               var nextPage =
//                                                   _currentGamePage + 1;
//                                               await getGameList(nextPage);
//                                               setState(() {
//                                                 _currentGamePage = nextPage;
//                                               });
//                                               _refreshController.loadComplete();
//                                             } catch (e) {
//                                               setState(() {
//                                                 _currentGamePage =
//                                                     _currentGamePage;
//                                               });
//                                               _refreshController.loadFailed();
//                                             }
//                                           },
//                                           onRefresh: () async {
//                                             print("onRefesh!!");
//                                             try {
//                                               setState(() {
//                                                 _gameCardList = null;
//                                               });
//                                               await getGameList(1);
//                                               setState(() {
//                                                 _currentGamePage = 1;
//                                               });
//                                               _refreshController.loadComplete();
//                                             } catch (e) {
//                                               setState(() {
//                                                 _currentGamePage =
//                                                     _currentGamePage;
//                                               });
//                                               _refreshController.loadFailed();
//                                             }
//                                           },
//                                           child: gameListView(
//                                               gameList: _gameCardList,
//                                               params: {
//                                                 "from": RouteList.APP_HOME,
//                                                 "notify": NotifyList.APP_HOME
//                                               })))
//                                   : Container(
//                                       padding: EdgeInsets.only(
//                                           top: 16,
//                                           left: 16,
//                                           bottom: 16,
//                                           right: 16),
//                                       child: Text("No results")),

//                               _articleCardList != null &&
//                                       _articleCardList.length > 0
//                                   ? RefreshConfiguration(
//                                       enableBallisticLoad: false,
//                                       footerTriggerDistance: -80,
//                                       maxUnderScrollExtent: 60,
//                                       child: SmartRefresher(
//                                           controller: _refreshController,
//                                           enablePullUp: true,
//                                           footer: ClassicFooter(
//                                             loadStyle:
//                                                 LoadStyle.ShowWhenLoading,
//                                           ),
//                                           onLoading: () async {
//                                             print("onLoading!!");
//                                             try {
//                                               var nextPage =
//                                                   _currentArtPage + 1;
//                                               await getArticleList(nextPage);
//                                               setState(() {
//                                                 _currentArtPage = nextPage;
//                                               });
//                                               _refreshController.loadComplete();
//                                             } catch (e) {
//                                               setState(() {
//                                                 _currentArtPage =
//                                                     _currentArtPage;
//                                               });
//                                               _refreshController.loadFailed();
//                                             }
//                                           },
//                                           onRefresh: () async {
//                                             print("onRefesh!!");
//                                             try {
//                                               setState(() {
//                                                 _articleCardList = null;
//                                               });
//                                               await getArticleList(1);
//                                               setState(() {
//                                                 _currentArtPage = 1;
//                                               });
//                                               _refreshController.loadComplete();
//                                             } catch (e) {
//                                               setState(() {
//                                                 _currentArtPage =
//                                                     _currentArtPage;
//                                               });
//                                               _refreshController.loadFailed();
//                                             }
//                                           },
//                                           child: articleListView(
//                                               articleList: _articleCardList,
//                                               params: {
//                                                 "from": RouteList.APP_HOME,
//                                                 "notify": NotifyList.APP_HOME
//                                               })))
//                                   : Container(
//                                       padding: EdgeInsets.only(
//                                           top: 16,
//                                           left: 16,
//                                           bottom: 16,
//                                           right: 16),
//                                       child: Text("No results"))
//                             ])
//                           : Center(child: CircularProgressIndicator())))
//             ])));
//   }

//   @override
//   bool get wantKeepAlive => true;

//   void showColoredToast(String toastMessage) {
//     Fluttertoast.showToast(
//         msg: toastMessage,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.deepPurple,
//         textColor: Colors.white);
//   }

//   testScript() {
//     return InkWell(
//       onTap: () => ThrioNavigator.push(
//           url: "native_webview",
//           params: {
//             "url":
//                 // "https://testfast.deplay.one/game/100001/10001/0?gid=100&gameid=1000&packetid=10000&isTest=1",
//                 // "http://172.20.10.3:3001/?gid=100&&gameid=1000001&&packetid=10000&isTest=1",
//                 "http://172.20.10.3:7000/articles/gold-mining-together_artid63",
//             "orientation": "vertical",
//             "fullscreen": false,
//             "title": null
//           },
//           animated: true,
//           poppedResult: (dynamic value) {
//             print("popResultValue :$value");
//           }),
//       child: Container(
//           padding: const EdgeInsets.all(8),
//           margin: const EdgeInsets.all(8),
//           color: Colors.grey,
//           child: Text(
//             'open game webview',
//             style: TextStyle(fontSize: 22, color: Colors.black),
//           )),
//     );
//   }
// }
