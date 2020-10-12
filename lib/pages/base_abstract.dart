import 'package:wallet4d/common/wallet_config.dart';
import 'package:wallet4d/utils/jh_screen_util.dart';

abstract class PageWithOverlay {
  updateOverlay() {
    JhScreenUtils.updateStatusBarStyle(uiOverlayStyle);
  }
}
