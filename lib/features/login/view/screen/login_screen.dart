import 'package:e_commerce_application/features/main_screen/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../register/view/screens/register_screen.dart';

import '../../model/login_request_model.dart';

import '../../view_model/login_cubit/login_cubit.dart';
import '../../view_model/login_cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          print("Listener: ${state.message}");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message),
                backgroundColor: Colors.red,)
          );
        } else if (state is LoginSuccessState) {
          print("Listener: ${state.message}");





         Navigator.pushReplacement(context,
             MaterialPageRoute(builder: (BuildContext context) {
               return MainScreen();
             }));





          ScaffoldMessenger.of(context).showSnackBar(SnackBar
            (content: Text(state.message),
            backgroundColor: Colors.green,
          ));
        } else {}
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Login",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
          color: Colors.white
          ),

          ),
        ),
        body:
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 150,),
                  Center(
                    child: Text("Login now, to continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "please enter email";
                      }
                      else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please enter password";
                      }else if (v.length<6){
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _obscurePassword =!_obscurePassword;
                          });
                        },
                            icon: Icon(_obscurePassword?
                            Icons.visibility_off_outlined:
                            Icons.visibility_outlined))
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {},
                      child: Text("Forget Password?", style:
                      TextStyle(color: Colors.green),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state is LoginLoadingState ? Center(
                          child: CircularProgressIndicator(),) :
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  loginRequestModel: LoginRequestModel(
                                      email: emailController.text,
                                      password: passwordController.text));
                              print("email:${emailController.text}\n "
                                  "password:${passwordController.text}");
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(
                              Size(
                                double.infinity,
                                50,
                              ),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(borderRadius:
                              BorderRadius.circular(15),),),
                            backgroundColor:
                            WidgetStatePropertyAll(Colors.green),
                          ),
                          child: Text("Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                        child: Text("Sign Up", style:
                        TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
