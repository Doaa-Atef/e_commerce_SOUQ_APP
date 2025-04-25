import 'package:e_commerce_application/core/routes/routes.dart';
import 'package:e_commerce_application/features/login/view/screen/login_screen.dart';
import 'package:e_commerce_application/features/login/view_model/login_cubit/login_cubit.dart';
import 'package:e_commerce_application/features/main_screen/view/screens/main_screen.dart';
import 'package:e_commerce_application/features/product_details/product_details_args.dart';
import 'package:e_commerce_application/features/product_details/view/screen/product_details_screen.dart';
import 'package:e_commerce_application/features/splash/view/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/category_details/view/category_details_screen.dart';

class RouteServices {

  static Route generateRoute(RouteSettings settings) {
    print("name========>${settings.name}");
    print("name========>${settings.arguments}");

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });

      case Routes.login:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          );
        });

      case Routes.main:
        return MaterialPageRoute(builder: (context) {

          return MainScreen();
        });

      case Routes.productDetails:
        return MaterialPageRoute(builder: (context) {
          final args=settings.arguments as ProductDetailsArgs;
          return ProductDetailsScreen( productDetailsArgs: args,);
            },

        );
      // case Routes.categoryProductsScreen:
      //   final int id =settings.arguments as int;
      //   return MaterialPageRoute(builder: (context){
      //     return CategoryProductsScreen(id: id);
      //   });

      case Routes.categoryDetailsScreen:
        final int id =settings.arguments as int;
        return MaterialPageRoute(builder: (context){
          return CategoryDetailsScreen(id: id);
        });

      default:
        return MaterialPageRoute(builder: (context) {
          return Container(
            child: Center(child: Text("Not Found")),
          );
        });
    }
  }
}