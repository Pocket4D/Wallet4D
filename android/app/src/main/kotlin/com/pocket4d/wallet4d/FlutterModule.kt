package com.pocket4d.wallet4d

import android.app.Activity
import android.content.Context
import com.hellobike.flutter.thrio.module.ModuleIntentBuilder
import com.hellobike.flutter.thrio.module.ThrioModule
import com.hellobike.flutter.thrio.navigator.IntentBuilder

object FlutterModule : ThrioModule(), ModuleIntentBuilder {

    override fun onModuleInit(context: Context) {
        // navigatorLogEnabled = false
    }

    override fun onModuleRegister(context: Context) {
        registerIntentBuilder("default", object : IntentBuilder {
            override fun getActivityClz(): Class<out Activity> {
                return DefaultActivity::class.java
            }
        })
    }

    override fun onIntentBuilderRegister(context: Context) {
        // TODO("Not yet implemented")
    }
}