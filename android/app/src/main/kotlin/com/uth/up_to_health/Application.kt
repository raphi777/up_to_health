package com.uth.up_to_health
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.view.FlutterMain
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService

import android.os.Build
import android.app.NotificationManager
import android.app.NotificationChannel

class Application : FlutterApplication(), PluginRegistrantCallback {

    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
        FlutterMain.startInitialization(this)
    }

    override fun registerWith(registry: PluginRegistry?) {
    }

    fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "groupChannel";
            val descriptionText = "This is the group channel";
            val importance = NotificationManager.IMPORTANCE_HIGH;
            val mChannel = NotificationChannel("59054", name, importance);
            mChannel.description = descriptionText;
            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager;
            notificationManager.createNotificationChannel(mChannel);
        }
    }
}