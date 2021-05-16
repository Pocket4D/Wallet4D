//
// Created on Sun May 16 2021.
//
// Copyright (c) 2021 wallet4d.
//

import 'package:hive/hive.dart';

import 'app_entry.dart';

part 'app_data.g.dart';

/// One box for all app data.
///
@HiveType(typeId: 0)
class AppData extends HiveObject {
  @HiveField(0)
  final wallets = <String, AppEntry>{};

  void updateWallets(Map<String, dynamic> json) {
    final ids = json.keys;
    for (final id in ids) {
      wallets[id] ??= AppEntry();
      wallets[id]!.updateFromJson(json[id] as Map<String, dynamic>);
    }
  }

  @HiveField(1)
  final dapps = <String, AppEntry>{};

  void updateDapps(Map<String, dynamic> json) {
    final ids = json.keys;
    for (final id in ids) {
      dapps[id] ??= AppEntry();
      dapps[id]!.updateFromJson(json[id] as Map<String, dynamic>);
    }
  }
}
