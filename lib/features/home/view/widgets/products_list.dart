import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../shared/widgets/product_item.dart';
import '../../../product_details/product_details_args.dart';
import '../../model/home_response_model.dart';
import '../../view_model/home_cubit.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("Top Products",style: TextStyle(color: AppColors.secondaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 20),)
    ,GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: context.read<HomeCubit>().homeResponseModel.homeData.homeProducts.length,
    itemBuilder: (BuildContext context, int index){
      List<HomeProducts> homeProducts = context.read<HomeCubit>().homeResponseModel.homeData.homeProducts;
      return InkWell(
        onTap: (){
          final int id = context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].id;
          Navigator.pushNamed(context, Routes.productDetails,arguments:  ProductDetailsArgs(productId: id));
        },
        child: ProductItem(
            image: homeProducts[index].image,
            name: homeProducts[index].name,
            price: homeProducts[index].price,
            productId: homeProducts[index].id,
        discount: homeProducts[index].discount.toInt(),),
      );
    },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 0.7,
    crossAxisCount: 2)
        )],
    );


  }
}
