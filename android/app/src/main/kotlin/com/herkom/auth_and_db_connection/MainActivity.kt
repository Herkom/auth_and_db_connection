package com.herkom.auth_and_db_connection

import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    this.getWindow().setStatusBarColor(android.graphics.Color.TRANSPARENT)
  }
}