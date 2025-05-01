import 'package:e_commerce_application/core/styles/app_colors.dart';
import 'package:e_commerce_application/features/search/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/product_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SearchCubit()
        ..searchForProducts(),
      child: Column(
        children: [
          BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
              // onChanged: (v){
              //   print(v);
              //   context.read<SearchCubit>().searchForProducts(searchText: v);
              // },
              onFieldSubmitted: (v){
                context.read<SearchCubit>().searchForProducts(searchText: v);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Search",
                prefixIcon: Icon(Icons.search) ,

              ),),
    );
  },
),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if(state is SearchLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(state is SearchSuccess){
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Total results: ",style: TextStyle(color: AppColors.secondaryColor,fontSize: 18),),
                            Text(context.read<SearchCubit>().searchResponseModel.searchData.total.toString(),style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: context.read<SearchCubit>().searchResponseModel.searchData.searchProducts.length,
                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing:  10,
                            crossAxisSpacing: 1,
                            childAspectRatio: 0.75,
                            crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(
                                  image: context.read<SearchCubit>().searchResponseModel.searchData.searchProducts[index].image,
                                  name: context.read<SearchCubit>().searchResponseModel.searchData.searchProducts[index].name,
                                  price: context.read<SearchCubit>().searchResponseModel.searchData.searchProducts[index].price,
                                  productId: context.read<SearchCubit>().searchResponseModel.searchData.searchProducts[index].id,
                              );
                            },),
                        ),
                      ],
                    ),
                  ),
                );
              }
              else if( state is SearchError){
                return Text("Search Error");
              }
              else{
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
