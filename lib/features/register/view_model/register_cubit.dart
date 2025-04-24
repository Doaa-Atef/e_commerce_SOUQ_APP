import 'package:bloc/bloc.dart';
import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/app_dio/end_points.dart';
import 'package:meta/meta.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  RegisterResponseModel? registerResponseModel;
 
 register({required RegisterRequestModel registerRequestModel})async{
   emit(RegisterLoadingState());
   final response = await AppDio.postData(endPoint: EndPoints.register,
   data: registerRequestModel.toJson());
   print("response=============>${response}");

   registerResponseModel=RegisterResponseModel.fromJson(response.data);

   if(registerResponseModel!.status==true){
     print(registerResponseModel!.data!.token);
     emit(RegisterSuccessState(message: registerResponseModel!.message));

   }else{
     emit(RegisterErrorState(error: registerResponseModel!.message));
   }

 }
 
}
