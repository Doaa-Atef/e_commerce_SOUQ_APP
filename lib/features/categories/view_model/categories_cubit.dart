import 'package:bloc/bloc.dart';
import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/app_dio/end_points.dart';
import 'package:e_commerce_application/features/categories/model/categories_response_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  late CategoriesResponseModel categoriesResponseModel;

  getCategories() async {
    emit(CategoriesLoading());
    final response = await AppDio.getData(endPoint: EndPoints.categories);
    print(response);
    categoriesResponseModel = CategoriesResponseModel.fromJson(response.data);
    if(categoriesResponseModel.status == true){
      print("categories response ====> $categoriesResponseModel");
      emit(CategoriesSuccess());
    }else{
      emit(CategoriesError());
    }

  }
  
}
