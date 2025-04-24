import 'package:e_commerce_application/core/routes/routes_services.dart';
import 'package:e_commerce_application/core/styles/app_colors.dart';
import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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