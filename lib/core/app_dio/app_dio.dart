import 'package:dio/dio.dart';

class AppDio{
 static late Dio _dio;


  static init(){
    BaseOptions options=BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {
        "lang":"en",
      },
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    );
    _dio = Dio(options);
  }

  static getData({required String endPoint, Map<String,dynamic> data=const{},Map<String,dynamic>queryParameters = const{}})
  async {
    try{
      final response= await _dio.get(endPoint,
          data: data,
          queryParameters: queryParameters
      );
      print("App Dio Response ==============> $response");
      return response;
    }on DioException catch(e){
      print("app dio error ===========>${e.response?.statusMessage}");
      return e.response?.statusMessage;
      
    }

  }

  static postData({required String endPoint, Map<String,dynamic> data=const{},Map<String,dynamic> queryParameters=const{}})async{
   try{
     final response=await _dio.post(endPoint,data: data,queryParameters: queryParameters);
     print("post Data===> ${response}");
     return response;
   }on DioException catch(e){
     print("Post Error===> ${e.response?.statusMessage}");
     return e.response?.statusMessage;
   }
  }

  static deleteData({required String endPoint,Map<String,dynamic> data=const{}, Map<String,dynamic> queryParameters= const{} })async{

    try{
      final response= await _dio.delete(endPoint,data: data,queryParameters: queryParameters);
      print("deleted Data ====> ${response}");
      return response;
    } on DioException catch(e){
      print("delete error =====> ${e.response}");
      return e.response;
    }
  }

  static putData({required String endPoint,Map<String,dynamic> data=const{}, Map<String,dynamic> queryParameters= const{} }) async{
    try{
      final response=await _dio.put(endPoint,data: data,queryParameters: queryParameters);
      print("updated Data ====> ${response}");
      return response;
    }on DioException catch(e){
      print("update error =====> ${e.response}");

      return e.response;
    }
  }

}
