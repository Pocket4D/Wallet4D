import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// default storage key
/// '__Wallet4D_Default_Storage_Key__'
const kWalletDefaultStorageKey = '__Wallet4D_Default_Storage_Key__';
const kWalletDefaultEncryptKey = '__Wallet4D_Default_Encrypt_Key__';

/// default storage psw
const kWalletKeyStore = "keyStore";
const kWalletName = "walletName";

/* 上次版本号 */
const kWalletDefaultLastVersion = '__Wallet4D_Storage_LastVersion__';

SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
    //黑色沉浸式状态栏。基于SystemUiOverlayStyle.dark修改了statusBarColor
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark);
