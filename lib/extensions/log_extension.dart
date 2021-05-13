part of 'extensions.dart';

extension LogExtension on Object? {
  void logI({String tag = _TAG, StackTrace? stackTrace}) {
    _log(this, '$tag ❕', stackTrace);
  }

  void logD({String tag = _TAG, StackTrace? stackTrace}) {
    _log(this, '$tag 📣', stackTrace);
  }

  void logW({String tag = _TAG, StackTrace? stackTrace}) {
    _log(this, '$tag ⚠️', stackTrace);
  }

  void logE({String tag = _TAG, StackTrace? stackTrace}) {
    _log(this, '$tag ❌', stackTrace, isError: true);
  }
}

const String _TAG = 'LOG';

void _log(
  Object? message,
  String tag,
  StackTrace? stackTrace, {
  bool isError = false,
}) {
  final DateTime _time = DateTime.now();
  _dev.log(
    '$_time - ${isError ? 'An error occurred.' : message}',
    time: _time,
    name: tag,
    error: isError ? message : null,
    stackTrace: stackTrace,
  );
}
