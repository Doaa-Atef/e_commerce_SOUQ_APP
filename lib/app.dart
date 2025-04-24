import 'package:e_commerce_application/core/routes/routes_services.dart';
import 'package:e_commerce_application/core/styles/app_colors.dart';
import 'package:e_commerce_application/features/login/view/screen/login_screen.dart';
import 'package:e_commerce_application/features/main_screen/view/screens/main_screen.dart';
import 'package:e_commerce_application/features/splash/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/login/view_model/login_cubit/login_cubit.dart';

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   // bool isLoggedIn= false;
   // checkUserId() async {
   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //  if(prefs.getInt('id').toString().isNotEmpty){
   //    isLoggedIn = true;
   //  } else{
   //    isLoggedIn = false;
   //  }
   //
   // }
  @override
  void initState(){
    // checkUserId();
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteServices.generateRoute,
// home: SplashScreen(),


      // home:  isLoggedIn? MainScreen(): BlocProvider(create: (context)=>LoginCubit(),
      // child: LoginScreen(),
      // ),
    );
  }
}