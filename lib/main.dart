import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/shared_prefs/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDio.init();
  print("get user id =========>${SharedPrefs.getInt("id")}");

  await SharedPrefs.init(); // تأكدي إن SharedPrefs اتعمله init
  runApp(

      MyApp(),
    // ),
  );
}

