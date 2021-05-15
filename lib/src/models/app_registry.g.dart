// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_registry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadLinkAdapter extends TypeAdapter<DownloadLink> {
  @override
  final int typeId = 0;

  @override
  DownloadLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadLink()
      ..browser = fields[0] as String
      ..ios = fields[1] as String
      ..android = fields[2] as String
      ..mac = fields[3] as String
      ..windows = fields[4] as String
      ..linux = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, DownloadLink obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.browser)
      ..writeByte(1)
      ..write(obj.ios)
      ..writeByte(2)
      ..write(obj.android)
      ..writeByte(3)
      ..write(obj.mac)
      ..writeByte(4)
      ..write(obj.windows)
      ..writeByte(5)
      ..write(obj.linux);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeepLinkAdapter extends TypeAdapter<DeepLink> {
  @override
  final int typeId = 1;

  @override
  DeepLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeepLink()
      ..native = fields[0] as String
      ..universal = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, DeepLink obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.native)
      ..writeByte(1)
      ..write(obj.universal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeepLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaDataAdapter extends TypeAdapter<MetaData> {
  @override
  final int typeId = 2;

  @override
  MetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaData()
      ..shortName = fields[0] as String
      ..colors = (fields[1] as List).cast<Color>();
  }

  @override
  void write(BinaryWriter writer, MetaData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.shortName)
      ..writeByte(1)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final int typeId = 3;

  @override
  Color read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Color()
      ..primary = fields[0] as String
      ..secondary = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.primary)
      ..writeByte(1)
      ..write(obj.secondary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppEntryAdapter extends TypeAdapter<AppEntry> {
  @override
  final int typeId = 4;

  @override
  AppEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppEntry()
      ..id = fields[0] as String
      ..name = fields[1] as String
      ..homePage = fields[2] as String
      ..chains = (fields[3] as List).cast<String>()
      ..app = fields[4] as DownloadLink
      ..mobile = fields[5] as DeepLink
      ..desktop = fields[6] as DeepLink
      ..metaData = fields[7] as MetaData;
  }

  @override
  void write(BinaryWriter writer, AppEntry obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.homePage)
      ..writeByte(3)
      ..write(obj.chains)
      ..writeByte(4)
      ..write(obj.app)
      ..writeByte(5)
      ..write(obj.mobile)
      ..writeByte(6)
      ..write(obj.desktop)
      ..writeByte(7)
      ..write(obj.metaData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppRegistryAdapter extends TypeAdapter<AppRegistry> {
  @override
  final int typeId = 5;

  @override
  AppRegistry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppRegistry()..apps = (fields[0] as Map).cast<String, AppEntry>();
  }

  @override
  void write(BinaryWriter writer, AppRegistry obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.apps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppRegistryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
