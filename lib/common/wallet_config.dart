import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// default storage key
const kWalletDefaultStorageKey = '___Wallet4D__Storage_Key';

/// default storage psw
const kWalletDefaultPsw = "___Wallet4D__Storage_PSW";

/* 上次版本号 */
const kWalletDefaultLastVersion = '___Wallet4D__Storage_LastVersion';

SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
    //黑色沉浸式状态栏。基于SystemUiOverlayStyle.dark修改了statusBarColor
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark);
