
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared_prefs/shared_prefs.dart';
import '../../../../core/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _textController;
  bool isVisible = false;

  String displayedText = "";
  int currentIndex = 0;
  late Timer _typewriterTimer;

  void showIcon() {
    setState(() {
      isVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    Future.delayed(Duration(milliseconds: 1000), () {
      showIcon();
      _textController.forward().whenComplete(() {
        startTypewriterEffect();
      });
    });
  }

  void startTypewriterEffect() {
    _typewriterTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (currentIndex < "Enjoy our products!".length) {
        setState(() {
          displayedText += "Enjoy our products!"[currentIndex];
          currentIndex++;
        });
      } else {
        _typewriterTimer.cancel();
        Future.delayed(Duration(milliseconds: 500),
            (){
          checkLoginStatus();
            });
      }
    });
  }

  Future<void> checkLoginStatus() async {
    int? userId = await SharedPrefs.getInt("id");
    if (userId != null) {
      Navigator.pushReplacementNamed(context, Routes.main);
    } else {
      Navigator.pushReplacementNamed(context, Routes.login);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _typewriterTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = "SOUQ APP".split("");

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: isVisible ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: Icon(
                Icons.storefront_outlined,
                size: 120,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(letters.length, (index) {
                final Animation<Offset> slideAnimation = Tween<Offset>(
                  begin: Offset(index.isEven ? -1.5 : 1.5, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _textController,
                    curve: Interval(
                      index / letters.length,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                );

                final Animation<double> fadeAnimation = Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: _textController,
                    curve: Interval(
                      index / letters.length,
                      1.0,
                      curve: Curves.easeIn,
                    ),
                  ),
                );

                return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: Text(
                      letters[index],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: AppColors.blackTextColor,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: AppColors.primaryColor.withOpacity(0.5),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              displayedText,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:e_commerce_application/core/styles/app_colors.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/routes/routes.dart';
// import '../../../../core/shared_prefs/shared_prefs.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController _textController;
//   bool isVisible = false;
//
//   void showIcon() {
//     setState(() {
//       isVisible = true;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _textController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1500),
//     );
//
//     Future.delayed(Duration(milliseconds: 100), () {
//       showIcon();
//       _textController.forward().whenComplete(() {
//         Future.delayed(Duration(milliseconds: 500), () {
//           // checkLoginStatus();
//         });
//       });
//     });
//   }
//
//   Future<void> checkLoginStatus() async {
//     int? userId = await SharedPrefs.getInt("id");
//     if (userId != null) {
//       Navigator.pushReplacementNamed(context, Routes.main);
//     } else {
//       Navigator.pushReplacementNamed(context, Routes.login);
//     }
//   }
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> letters = "SOUQ APP".split("");
//     return Scaffold(
//       backgroundColor: AppColors.secondaryColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedOpacity(
//               opacity: isVisible ? 1 : 0,
//               duration: Duration(milliseconds: 1000),
//               child: Icon(
//                 Icons.storefront_outlined,
//                 size: 120,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//             SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(letters.length, (index) {
//                 final Animation<Offset> slideAnimation = Tween<Offset>(
//                   begin: Offset(index.isEven ? -1.5 : 1.5, 0),
//                   end: Offset.zero,
//                 ).animate(
//                   CurvedAnimation(
//                     parent: _textController,
//                     curve: Interval(
//                       index / letters.length,
//                       1.0,
//                       curve: Curves.easeOut,
//                     ),
//                   ),
//                 );
//
//                 final Animation<double> fadeAnimation = Tween<double>(
//                   begin: 0.0,
//                   end: 1.0,
//                 ).animate(
//                   CurvedAnimation(
//                     parent: _textController,
//                     curve: Interval(
//                       index / letters.length,
//                       1.0,
//                       curve: Curves.easeIn,
//                     ),
//                   ),
//                 );
//
//                 return SlideTransition(
//                   position: slideAnimation,
//                   child: FadeTransition(
//                     opacity: fadeAnimation,
//                     child: Text(
//                       letters[index],
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2,
//                         color: AppColors.blackTextColor,
//                         shadows: [
//                           Shadow(
//                             blurRadius: 10,
//                             color: AppColors.primaryColor.withOpacity(0.5),
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             Text("Enjoy our products!",style: TextStyle(color: AppColors.primaryColor,
//             fontSize: 25),),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// // import 'package:e_commerce_application/core/styles/app_colors.dart';
// // import 'package:flutter/material.dart';
// // import '../../../../core/routes/routes.dart';
// // import '../../../../core/shared_prefs/shared_prefs.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});
// //
// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
// //   late AnimationController _textController;
// //   late AnimationController _iconController;
// //   bool isVisible = false;
// //   showIcon(){
// //     setState(() {
// //       isVisible = true;
// //
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     Future.delayed(Duration(milliseconds: 100)).then((onValue){
// //         showIcon();
// //     });
// //     super.initState();
// //     _textController = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 1000),
// //     );
// //     _iconController = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 1000),
// //     );
// //
// //     _textController.forward().whenComplete(() {
// //       Future.delayed(Duration(milliseconds: 500), () {
// //         checkLoginStatus();
// //       });
// //     });
// //
// //     Future.delayed(Duration(seconds: 4)).then((value) {
// //
// //        checkLoginStatus();
// //     });
// //   }
// //
// //   checkLoginStatus() async {
// //     int? userId = await SharedPrefs.getInt("id");
// //     if (userId != null) {
// //       // Navigator.pushReplacementNamed(context, Routes.main);
// //     } else {
// //      // Navigator.pushReplacementNamed(context, Routes.login);
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     _textController.dispose();
// //     _iconController.dispose();
// //     super.dispose();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     List<String> letters = "SOUQ APP".split("");
// //     return Scaffold(
// //       backgroundColor: AppColors.secondaryColor,
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             AnimatedOpacity(
// //               opacity: isVisible?1:0,
// //               duration: Duration(milliseconds: 1000),
// //               child: Icon(Icons.storefront_outlined, size: 100,
// //                 color:AppColors.primaryColor ),
// //             ),
// //             SizedBox(height: 30),
// //
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: List.generate(letters.length, (index) {
// //                 final slideAnimation = Tween<Offset>(begin: Offset(index.isEven ? -2 : 2, 0), end: Offset.zero)
// //                     .animate(CurvedAnimation(parent: _textController, curve: Interval(index / letters.length, 1.0, curve: Curves.easeOut)));
// //
// //                 final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// //                   CurvedAnimation(parent: _textController, curve: Interval(index / letters.length, 1.0, curve: Curves.easeIn)),
// //                 );
// //
// //                 return AnimatedBuilder(
// //                   animation: _textController,
// //                   builder: (context, child) {
// //                     return Opacity(
// //                       opacity: fadeAnimation.value,
// //                       child: Transform.translate(
// //                         offset: slideAnimation.value ,
// //                         child: Text(
// //                           letters[index],
// //                           style: TextStyle(
// //                             fontSize: 30,
// //                             fontWeight: FontWeight.bold,
// //                             letterSpacing: 2,
// //                             color: AppColors.blackTextColor,
// //                             shadows: [
// //                               Shadow(
// //                                 blurRadius: 10,
// //                                 color: AppColors.primaryColor.withOpacity(0.5),
// //                                 offset: Offset(1, 1),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               }),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
