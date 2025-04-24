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

  static getData({
    required String endPoint, Map<String,dynamic> data=const{},Map<String,dynamic>queryParameters = const{}})
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

}
