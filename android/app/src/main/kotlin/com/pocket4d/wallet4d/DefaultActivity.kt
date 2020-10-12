package com.pocket4d.wallet4d

import android.annotation.SuppressLint
import android.app.Activity
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.view.View
import com.airbnb.lottie.LottieAnimationView
import com.hellobike.flutter.thrio.navigator.PageNotifyListener
import com.hellobike.flutter.thrio.navigator.ThrioNavigator
import com.pocket4d.wallet4d.constant.Route
import kotlinx.android.synthetic.main.activity_native.*

@SuppressLint("Registered")
class DefaultActivity : Activity(), PageNotifyListener {

    private lateinit var loadingView: LottieAnimationView
    private lateinit var uiHandler: Handler

    @SuppressLint("SetTextI18n")
    private fun initView() {
        loadingView.playAnimation()
    }

    @SuppressLint("SetTextI18n")
    override fun onResume() {
        super.onResume()
    }

    override fun onNotify(name: String, params: Any?) {
        Log.e("Thrio", "native1 onNotify name $name params $params")
        // result with url
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        Log.e("FlutterView", "onCreate activity $this")
        super.onCreate(savedInstanceState)
        uiHandler = Handler()
        setContentView(R.layout.activity_native)
        loadingView = loading_splash
        initView()
        init()
    }

    private fun init() {

        object : Thread() {
            override fun run() {
                this@DefaultActivity.uiHandler.postDelayed({
                    ThrioNavigator.push(
                            Route.WALLET_INDEX,
                            params = mapOf("endpoint" to "default"),
                            result = {
                                Log.e("Thrio", "push result data $it")
                            },
                            poppedResult = {
                                Log.e("Thrio", "native1 poppedResult call params $it")
                            })

                    loadingView.pauseAnimation()
                    loadingView.cancelAnimation()
                    loadingView.removeAllAnimatorListeners()
                    loadingView.visibility = View.GONE

                    finish()
                }, 2500)
            }
        }.start()


    }

}