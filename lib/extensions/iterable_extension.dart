part of 'extensions.dart';

extension IterableExtension on Iterable<dynamic> {}

extension NullableIterableExtension on Iterable<dynamic>? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}

extension MapExtension on Map<dynamic, dynamic> {
  void removeAllEmptyEntry() => removeWhere(
        (dynamic k, dynamic v) => k == null || v == null || v == '',
      );
}