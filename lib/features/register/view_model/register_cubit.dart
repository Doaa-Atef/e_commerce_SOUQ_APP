import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_application/core/app_dio/end_points.dart';
import 'package:meta/meta.dart';

import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  final dio =Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60)
    )
  );

 RegisterResponseModel? registerResponseModel;
 
 register({required RegisterRequestModel registerRequestModel})async{
   emit(RegisterLoadingState());
   final response = await dio.post(EndPoints.register,
   data: registerRequestModel.toJson());
   print("response=============>${response}");

   registerResponseModel=RegisterResponseModel.fromJson(response.data);
   if(registerResponseModel!.status==true){
     print(registerResponseModel!.data!.token);
     emit(RegisterSuccessState(message: registerResponseModel!.message));

   }else{
     print("register status=======>${registerResponseModel!.status}");
     print("register message======>${registerResponseModel!.message}");
     emit(RegisterErrorState(error: registerResponseModel!.message));
   }

 }
 
}
