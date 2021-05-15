//
// Created on Sat May 15 2021.
//
// Copyright (c) 2021 wallet4d.
//

import 'package:hive/hive.dart';

part 'app_registry.g.dart';

@HiveType(typeId: 0)
class DownloadLink {
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
  @HiveField(0)
  late String native;

  @HiveField(1)
  late String universal;
}

@HiveType(typeId: 2)
class MetaData {
  @HiveField(0)
  late String shortName;

  @HiveField(1)
  late List<Color> colors;
}

@HiveType(typeId: 3)
class Color {
  @HiveField(0)
  late String primary;

  @HiveField(1)
  late String secondary;
}

@HiveType(typeId: 4)
class AppEntry {
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
  @HiveField(0)
  late Map<String, AppEntry> apps;
}
