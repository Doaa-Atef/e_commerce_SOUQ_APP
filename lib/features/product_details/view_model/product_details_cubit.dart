import 'package:bloc/bloc.dart';
import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/app_dio/end_points.dart';
import 'package:e_commerce_application/features/product_details/model/product_details_model_response.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  late ProductDetailsModelResponse productDetailsModelResponse;

  getProductDetails({required int productId}) async {

      emit(ProductDetailsLoading());
      final response = await AppDio.getData(endPoint: EndPoints.productDetails+productId.toString());
      print("Response====>  >> $response");
   if(response == "Not Found"){
     emit(ProductDetailsError(message: "Not Found"));
   }else{
     productDetailsModelResponse=ProductDetailsModelResponse.fromJson(json:response.data);
     if(productDetailsModelResponse.status==true){
       emit(ProductDetailsSuccess());
     }else{
       print(productDetailsModelResponse.message);
       emit(ProductDetailsError(message: productDetailsModelResponse.message));
     }
   }



    }
  }

