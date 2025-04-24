import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDio.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  print("get user id =========>${prefs.getInt("id")}");
  runApp( MyApp());
}

