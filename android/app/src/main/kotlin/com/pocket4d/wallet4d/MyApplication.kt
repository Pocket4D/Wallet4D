package com.pocket4d.wallet4d

import androidx.multidex.MultiDexApplication
import com.hellobike.flutter.thrio.module.ThrioModule

class MyApplication : MultiDexApplication() {
    override fun onCreate() {
        super.onCreate()
        ThrioModule.init(this, FlutterModule)
    }
}