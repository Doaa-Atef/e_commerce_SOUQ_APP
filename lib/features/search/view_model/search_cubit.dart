import 'package:bloc/bloc.dart';
import 'package:e_commerce_application/core/app_dio/app_dio.dart';
import 'package:e_commerce_application/core/app_dio/end_points.dart';
import 'package:e_commerce_application/features/search/model/search_response_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  late SearchResponseModel searchResponseModel;

  searchForProducts({String searchText = ""}) async {
    emit(SearchLoading());
    final response= await AppDio.postData(endPoint: EndPoints.searchProducts,
        data:{
             "text":searchText,
        });
print("search response+========> $response " );
    searchResponseModel = SearchResponseModel.fromJson(json: response.data);
    print("searchResponseModel.status ${searchResponseModel.status}");
    if(searchResponseModel.status== true){
      emit(SearchSuccess());

    }else{
      emit(SearchError(searchResponseModel.message));
    }
  }


}
