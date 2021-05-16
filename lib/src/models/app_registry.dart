//
// Created on Sat May 15 2021.
//
// Copyright (c) 2021 wallet4d.
//

import 'package:hive/hive.dart';

part 'app_registry.g.dart';

@HiveType(typeId: 0)
class DownloadLink {
  DownloadLink();

  factory DownloadLink.fromJson(Map<String, dynamic> json) => DownloadLink()
    ..browser = json['browser'] as String
    ..ios = json['ios'] as String
    ..android = json['android'] as String
    ..mac = json['mac'] as String
    ..windows = json['windows'] as String
    ..linux = json['linux'] as String;

  @HiveField(0)
  late String browser;

  @HiveField(1)
  late String ios;

  @HiveField(2)
  late String android;

  @HiveField(3)
  late String mac;

  @HiveField(4)
  late String windows;

  @HiveField(5)
  late String linux;
}

@HiveType(typeId: 1)
class DeepLink {
  DeepLink();

  factory DeepLink.fromJson(Map<String, dynamic> json) => DeepLink()
    ..native = json['native'] as String
    ..universal = json['universal'] as String;

  @HiveField(0)
  late String native;

  @HiveField(1)
  late String universal;
}

@HiveType(typeId: 2)
class MetaData {
  MetaData();

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData()
    ..shortName = json['shortName'] as String
    ..colors = (json['colors'] as List<Map<String, dynamic>>).map((it) => Color.fromJson(it)).toList();

  @HiveField(0)
  late String shortName;

  @HiveField(1)
  late List<Color> colors;
}

@HiveType(typeId: 3)
class Color {
  Color();

  factory Color.fromJson(Map<String, dynamic> json) => Color()
    ..primary = json['primary'] as String
    ..secondary = json['secondary'] as String;

  @HiveField(0)
  late String primary;

  @HiveField(1)
  late String secondary;
}

@HiveType(typeId: 4)
class AppEntry {
  AppEntry();

  factory AppEntry.fromJson(Map<String, dynamic> json) => AppEntry()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..homePage = json['homepage'] as String
    ..chains = json['chains'] as List<String>
    ..app = DownloadLink.fromJson(json['app'] as Map<String, dynamic>)
    ..mobile = DeepLink.fromJson(json['mobile'] as Map<String, dynamic>)
    ..desktop = DeepLink.fromJson(json['desktop'] as Map<String, dynamic>)
    ..metaData = MetaData.fromJson(json['metaData'] as Map<String, dynamic>);

  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String homePage;

  @HiveField(3)
  late List<String> chains;

  @HiveField(4)
  late DownloadLink app;

  @HiveField(5)
  late DeepLink mobile;

  @HiveField(6)
  late DeepLink desktop;

  @HiveField(7)
  late MetaData metaData;
}

@HiveType(typeId: 5)
class AppRegistry {
  AppRegistry();

  factory AppRegistry.fromJson(Map<String, dynamic> json) => AppRegistry()
    ..apps = <String, AppEntry>{json.keys.first: AppEntry.fromJson(json.values.first as Map<String, dynamic>)};

  @HiveField(0)
  late Map<String, AppEntry> apps;
}
