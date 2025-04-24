import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_dio/end_points.dart';
import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  final dio=Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/" ,
        receiveTimeout: Duration(seconds: 60),
        connectTimeout: Duration(seconds: 60),
      )
  );
   LoginResponseModel? loginResponseModel;
  login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoadingState());

    final response = await  dio.post(EndPoints.login,
    data: loginRequestModel.toJson());

    print(response);
    loginResponseModel=LoginResponseModel.fromJson(response.data);
    if(loginResponseModel!.status == true)
{
  print("Login Done");
  print(loginResponseModel!.data!.token);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setInt("id", loginResponseModel!.data!.id);
   await prefs.setString("token", loginResponseModel!.data!.token);
   await prefs.setString("name", loginResponseModel!.data!.name);
   await prefs.setString("email", loginResponseModel!.data!.email);
   await prefs.setString("phone", loginResponseModel!.data!.phone);
   await prefs.setString("image", loginResponseModel!.data!.image);

  print("Id Saved${prefs.getInt("id")}");
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
