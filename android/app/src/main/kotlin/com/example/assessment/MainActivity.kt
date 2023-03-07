package com.example.assessment

import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.net.*;
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import android.app.Notification
import android.graphics.BitmapFactory

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/battery"
  private val CHANNEL_ID = "channel_id_example_01"
  private val notificationId = 101
  
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        // This method is invoked on the main thread.
        call, result ->
        if (call.method == "getBatteryLevel") {
          val batteryLevel = getBatteryLevel()
  
          if (batteryLevel != -1) {
            result.success(batteryLevel)
          } else {
            result.error("UNAVAILABLE", "Battery level not available.", null)
          }
        }else if(call.method == "createNotificationChannel"){

          createNotificationChannel()

        } else if (call.method == "sendNotification"){

          var title :String? = call.argument("title")
          var desc  :String? = call.argument("desc")
          
          sendNotification(title.toString(), desc.toString())

        }else if(call.method == "openEmailApp"){

            openEmailApp()

        }else {
          result.notImplemented()
        }
      }
  
  }

  private fun getBatteryLevel(): Int {
    val batteryLevel: Int
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }

    return batteryLevel
  }
  
  private fun openEmailApp() {
    val intent =  Intent(Intent.ACTION_SENDTO).apply{

        data = Uri.parse("mailto:");
        // putExtra(intent.EXTRA_SUBJECT, "message");
        // putExtra(intent.EXTRA_TEXT, "body");
    };
    
    startActivity(intent);
  }


  private fun createNotificationChannel() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {

        val name = "Notification Title"
        val descriptionText = "Notification Description"
        val importance = NotificationManager.IMPORTANCE_HIGH
        val channel = NotificationChannel(CHANNEL, name, importance).apply {description=descriptionText}

        val notificationManager: NotificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.createNotificationChannel(channel)
    }
  }

  private fun sendNotification(title: String, description: String) {
      val builder = NotificationCompat.Builder(this, CHANNEL)
          .setSmallIcon(androidx.loader.R.drawable.notification_bg)
          .setContentTitle(title)
          .setContentText(description)
          .setDefaults(Notification.DEFAULT_ALL)
          .setLargeIcon(BitmapFactory.decodeResource(getResources(), androidx.loader.R.drawable.notification_icon_background))
          .setPriority(Notification.PRIORITY_MAX);

      with(NotificationManagerCompat.from(this)){
        notify(notificationId, builder.build())
      }  
  }
}
