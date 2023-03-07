package com.example.assessment

import android.content.Context
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

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/battery"

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
        }else if(call.method == "openEmailApp"){

            openEmailApp()

        } else {
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
  private void addNotification() {  
    NotificationCompat.Builder builder =  
            new NotificationCompat.Builder(this)  
                    .setSmallIcon(R.drawable.messageicon) //set icon for notification  
                    .setContentTitle("Notifications Example") //set title of notification  
                    .setContentText("This is a notification message")//this is notification message  
                    .setAutoCancel(true) // makes auto cancel of notification  
                    .setPriority(NotificationCompat.PRIORITY_DEFAULT); //set priority of notification  


    Intent notificationIntent = new Intent(this, NotificationView.class);  
    notificationIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);  
    //notification message will get at NotificationView  
    notificationIntent.putExtra("message", "This is a notification message");  

    PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent,  
            PendingIntent.FLAG_UPDATE_CURRENT);  
    builder.setContentIntent(pendingIntent);  

    // Add as notification  
    NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);  
    manager.notify(0, builder.build());  
}  
}
