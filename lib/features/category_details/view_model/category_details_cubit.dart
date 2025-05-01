import 'package:bloc/bloc.dart';
import 'package:e_commerce_application/features/category_details/model/CategoryDetailsModel.dart';
import 'package:meta/meta.dart';

import '../../../core/app_dio/app_dio.dart';
import '../../../core/app_dio/end_points.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());

  late CategoryDetailsModel categoryDetailsModel;

  Future <void> getCategoryDetails(int categoryId) async{
    emit(CategoryDetailsLoading());

    try {
      final response = await AppDio.getData(endPoint: EndPoints.categoryDetails + categoryId.toString());
      categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);
      if (categoryDetailsModel.status == true) {
        emit(CategoryDetailsSuccess());
      } else {
        emit(CategoryDetailsError());
      }
    } catch (e) {
      print("Error fetching category Details: $e");
      emit(CategoryDetailsError());
    }
  }


}


