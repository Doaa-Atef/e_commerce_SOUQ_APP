import 'package:e_commerce_application/features/categories/view/screens/categories_screen.dart';
import 'package:e_commerce_application/features/home/view/screens/home_screen.dart';
import 'package:e_commerce_application/features/main_screen/view/widgets/main_screen_drawer.dart';
import 'package:e_commerce_application/features/search/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> screens=[
    HomeScreen(),
    CategoriesScreen(),
    SearchScreen(),
    Text("Favorites Products"),
  ];

  int index =0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
     appBar: AppBar(),
      drawer: MainScreenDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
          onTap: (v){
            setState(() {
              index=v;
            });
          },
          type: BottomNavigationBarType.fixed,
          items:
      [BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(label:"Categories",icon: Icon(Icons.category_outlined)),
        BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search_outlined)),
        BottomNavigationBarItem(label:"Favorites",icon: Icon(Icons.favorite_outline)),
      ]),
       body: screens[index],
    );
  }
}
