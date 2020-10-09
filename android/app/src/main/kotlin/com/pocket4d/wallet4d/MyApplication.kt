package com.pocket4d.wallet4d

import android.app.Application
import com.hellobike.flutter.thrio.module.ThrioModule

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        ThrioModule.init(this, FlutterModule)
    }
}