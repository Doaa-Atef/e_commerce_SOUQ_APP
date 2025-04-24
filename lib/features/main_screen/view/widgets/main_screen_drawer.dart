import 'package:e_commerce_application/features/login/view/screen/login_screen.dart';
import 'package:e_commerce_application/features/login/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,
            horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/OIP.jpg"),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Doaa Atef Muhammed",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),),
                      Text("View Profile",
                        style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic
                        ),),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Divider(),
            SizedBox(height: 20,),
            listTileItem(text: "Notifications",icon: Icons.notifications_none_rounded),
            listTileItem(text: "Favorites",icon: Icons.favorite_outline_rounded),
            listTileItem(text: "Orders",icon: Icons.pest_control_rodent_outlined),
            listTileItem(text: "Settings",icon: Icons.settings),
            listTileItem(text: "Contact Us",icon: Icons.contacts),
            listTileItem(text: "FAQS",icon: Icons.question_answer_outlined),
            listTileItem(text: "Complains",icon: Icons.chat_bubble_outline),
            listTileItem(text: "Privacy Policy",icon: Icons.privacy_tip_outlined),
            Spacer(),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("id");
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => LoginCubit(),
                    child: LoginScreen(),
                  );
                }));
              },
              child: ListTile(
                leading: Icon(Icons.login_outlined),
                title: Text("LogOut"),
              ),
            )

          ],
        ),
      ),
    );
  }
}
Widget listTileItem({required String text, required IconData icon}){
  return Column(
    children: [
      ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    ],
  );
}
