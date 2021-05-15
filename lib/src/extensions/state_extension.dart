// ignore_for_file: invalid_use_of_protected_member
part of 'extensions.dart';

extension SafeSetStateExtension on State {
  FutureOr<void> safeSetState(FutureOr<dynamic> Function() fn) async {
    await fn();
    if (mounted &&
        !context.debugDoingBuild &&
        context.owner?.debugBuilding == false) {
      setState(() {});
    }
  }
}
