import 'package:e_commerce_application/features/category_details/view_model/category_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/widgets/product_item.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDetailsCubit()..getCategoryDetails(id),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
          builder: (context, state) {
            if(state is CategoryDetailsLoading){
              return Center(child: CircularProgressIndicator());
            } else if( state is CategoryDetailsSuccess){
              return GridView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: context.read<CategoryDetailsCubit>().categoryDetailsModel.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  int id = context.read<CategoryDetailsCubit>().categoryDetailsModel.data.data[index].id;
                  return ProductItem(
                    image: context.read<CategoryDetailsCubit>().categoryDetailsModel.data.data[index].image,
                    name: context.read<CategoryDetailsCubit>().categoryDetailsModel.data.data[index].name,
                    price:context.read<CategoryDetailsCubit>().categoryDetailsModel.data.data[index].price,
                    productId:id ,

                  );
                }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing:  10,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.75,
                  crossAxisCount: 2) ,
              );
            }else{
              return Center(child: Text('No Products in this Category'
                  ));
            }
          },
        ),

      ),
    );
  }
}
