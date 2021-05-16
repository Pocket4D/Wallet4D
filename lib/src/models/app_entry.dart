//
// Created on Sat May 15 2021.
//
// Copyright (c) 2021 wallet4d.
//

import 'package:hive/hive.dart';

part 'app_entry.g.dart';

@HiveType(typeId: 10)
class DownloadLink extends HiveObject {
  void updateFromJson(Map<String, dynamic> json) => DownloadLink()
    ..browser = json['browser'] as String
    ..ios = json['ios'] as String
    ..android = json['android'] as String
    ..mac = json['mac'] as String
    ..windows = json['windows'] as String
    ..linux = json['linux'] as String;

  @HiveField(0)
  late final String browser;

  @HiveField(1)
  late final String ios;

  @HiveField(2)
  late final String android;

  @HiveField(3)
  late final String mac;

  @HiveField(4)
  late final String windows;

  @HiveField(5)
  late final String linux;
}

@HiveType(typeId: 11)
class DeepLink extends HiveObject {
  void updateFromJson(Map<String, dynamic> json) => DeepLink()
    ..native = json['native'] as String
    ..universal = json['universal'] as String;

  @HiveField(0)
  late final String native;

  @HiveField(1)
  late final String universal;
}

@HiveType(typeId: 12)
class MetaData extends HiveObject {
  void updateFromJson(Map<String, dynamic> json) => MetaData()
    ..shortName = json['shortName'] as String
    ..colors = (json['colors'] as List<Map<String, dynamic>>).map((it) => Color()..updateFromJson(it)).toList();

  @HiveField(0)
  late final String shortName;

  @HiveField(1)
  late final List<Color> colors;
}

@HiveType(typeId: 13)
class Color extends HiveObject {
  void updateFromJson(Map<String, dynamic> json) => Color()
    ..primary = json['primary'] as String
    ..secondary = json['secondary'] as String;

  @HiveField(0)
  late final String primary;

  @HiveField(1)
  late final String secondary;
}

@HiveType(typeId: 14)
class AppEntry extends HiveObject {
  void updateFromJson(Map<String, dynamic> json) => AppEntry()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..homePage = json['homepage'] as String
    ..chains = json['chains'] as List<String>
    ..app = DownloadLink()
    ..updateFromJson(json['app'] as Map<String, dynamic>)
    ..mobile = DeepLink()
    ..updateFromJson(json['mobile'] as Map<String, dynamic>)
    ..desktop = DeepLink()
    ..updateFromJson(json['desktop'] as Map<String, dynamic>)
    ..metaData = MetaData()
    ..updateFromJson(json['metaData'] as Map<String, dynamic>);

  @HiveField(0)
  late final String id;

  @HiveField(1)
  late final String name;

  @HiveField(2)
  late final String homePage;

  @HiveField(3)
  late final List<String> chains;

  @HiveField(4)
  late final DownloadLink app;

  @HiveField(5)
  late final DeepLink mobile;

  @HiveField(6)
  late final DeepLink desktop;

  @HiveField(7)
  late final MetaData metaData;

  @HiveField(8)
  DateTime lastOpenedAt = DateTime.now();
}
