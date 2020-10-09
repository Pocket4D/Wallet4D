package com.pocket4d.wallet4d

import android.annotation.SuppressLint
import android.app.Activity
import android.os.Bundle
import android.util.Log
// import android.util.Patterns
import com.airbnb.lottie.LottieAnimationView
// import androidx.appcompat.app.AppCompatActivity
import com.hellobike.flutter.thrio.navigator.PageNotifyListener
//import com.hellobike.flutter.thrio.navigator.RouteSettings
//import com.hellobike.flutter.thrio.navigator.ThrioNavigator
import kotlinx.android.synthetic.main.activity_native.*

class DefaultActivity : Activity(), PageNotifyListener {

    private lateinit var loadingView: LottieAnimationView

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
        setContentView(R.layout.activity_native)
        loadingView = loading_splash
        initView()
    }


}