import 'package:e_commerce_application/features/home/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/app_colors.dart';
import '../../view_model/home_cubit.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text("Top Products",style: TextStyle(color: AppColors.secondaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 20),)
    ,GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: context.read<HomeCubit>().homeResponseModel.homeData.homeProducts.length,
    itemBuilder: (BuildContext context, int index){
    return ProductItem(index: index);
    },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 0.8,
    crossAxisCount: 2)
        )],
    );


  }
}
