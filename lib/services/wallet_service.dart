import 'package:substrate_sign_flutter/substrate_sign_flutter.dart';
import 'package:wallet4d/common/chain_substrate.dart';
import 'package:wallet4d/common/wallet_config.dart';
import 'package:wallet4d/constant/chain_spec.dart';
import 'package:wallet4d/utils/jh_storage_util.dart';

const int phraseLength = 12;

class WalletService {
  static String genPhrase() {
    return randomPhrase(phraseLength);
  }

  static Map<String, dynamic> getWallet() {
    try {
      var stored = JhStorageUtils.getModelWithKey(kWalletDefaultStorageKey);
      if (stored != null) {
        return Map<String, dynamic>.from(stored);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<bool> saveWallet(String phrase, String name, String password) async {
    try {
      var encrypted = encryptData(phrase, password);
      var result = await JhStorageUtils.saveModel(
          kWalletDefaultStorageKey, {kWalletKeyStore: encrypted, kWalletName: name});
      if (!result) {
        throw "Wallet create failed";
      }
      return result;
    } catch (e) {
      throw e;
    }
  }

  static WalletService _instance;
  WalletService._internal() {
    updateWallet();
  }

  factory WalletService() => _getInstance();
  static WalletService get instance => _instance;

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = WalletService._internal();
    }
    return _instance;
  }

  String get walletName => _walletName;
  String get keyStore => _keyStore;

  String _keyStore;
  String _walletName;

  void updateWallet() {
    var storedWallet = WalletService.getWallet();
    if (storedWallet != null) {
      _keyStore = storedWallet[kWalletKeyStore];
      _walletName = storedWallet[kWalletName];
    }
  }

  Future<bool> destroyWallet() async {
    try {
      if (getWallet() != null) {
        var result = await JhStorageUtils.removeWithKey(kWalletDefaultStorageKey);
        if (result == false) {
          throw 'Cannot remove wallet';
        }

        return result;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }
}
