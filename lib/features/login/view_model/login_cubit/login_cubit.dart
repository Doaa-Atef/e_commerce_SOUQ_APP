import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/shared_prefs/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_dio/end_points.dart';
import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
   LoginResponseModel? loginResponseModel;

  login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoadingState());

    final response = await  AppDio.postData(
    data: loginRequestModel.toJson(), endPoint: EndPoints.login);

    print(response);


    loginResponseModel=LoginResponseModel.fromJson(response.data);
    if(loginResponseModel!.status == true)
   {
  print("Login Done");
  print(loginResponseModel!.data!.token);
   await SharedPrefs.setInt("id", loginResponseModel!.data!.id);
   await SharedPrefs.setString("token", loginResponseModel!.data!.token);
   await SharedPrefs.setString("name", loginResponseModel!.data!.name);
   await SharedPrefs.setString("email", loginResponseModel!.data!.email);
   await SharedPrefs.setString("phone", loginResponseModel!.data!.phone);
   await SharedPrefs.setString("image", loginResponseModel!.data!.image);

  print("Id Saved${SharedPrefs.getInt("id")}");
  emit(LoginSuccessState(message: loginResponseModel!.message));
}
    else
    {
      print("Login Failed");
      print(loginResponseModel!.message);
      print(loginResponseModel!.status);
      emit(LoginErrorState(message: loginResponseModel!.message));
    }

  }
}
