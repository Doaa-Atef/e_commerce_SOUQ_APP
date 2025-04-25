import 'package:e_commerce_application/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/shared_prefs/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkLoginStatus() async {
    int? userId = await SharedPrefs.getInt("id");
    if (userId != null) {
     Navigator.pushReplacementNamed(context, Routes.main);
    }
    else {
 Navigator.pushReplacementNamed(context, Routes.login);
    }
  }


  @override
  void initState() {
    Future.delayed(Duration(seconds: 2
    )).then(
            (onValue) {
checkLoginStatus();
        }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.storefront_outlined,
              size: 100,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 10,),
            Text("SOUQ APP", style: TextStyle(color:
            AppColors.blackTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 25
            ),)

          ],),
      ),
    );
  }
}
