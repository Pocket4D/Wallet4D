import 'package:thrio/thrio.dart';

import 'package:pocket4d/routes/p4dModule/module.dart' as p4dModule;
import 'package:wallet4d/routes/walletModule/module.dart' as walletModule;

class Module with ThrioModule {
  @override
  void onModuleRegister() {
    registerModule(walletModule.Module());
    registerModule(p4dModule.Module());
  }
}
