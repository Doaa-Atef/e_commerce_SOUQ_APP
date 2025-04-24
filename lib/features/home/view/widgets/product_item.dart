import 'package:e_commerce_application/features/product_details/view/screen/product_details_screen.dart';
import 'package:e_commerce_application/features/product_details/view_model/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../product_details/product_details_args.dart';
import '../../view_model/home_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        final int id=  context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].id;

        Navigator.pushNamed(context, Routes.productDetails,
        arguments: ProductDetailsArgs(productId: id),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
          color: AppColors.primaryColor.withOpacity(0.1),

        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 30,),
                Image.network(context.read<HomeCubit>().homeResponseModel.
                homeData.homeProducts[index].image,
                  height: 125,
                  width: 125,),
                Divider(),
                Text(context.read<HomeCubit>().homeResponseModel.
                homeData.homeProducts[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.center,),
              ],
            ),


            Positioned(
              top:0,
              left:0,
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.favorite_border_rounded,
                    color: Colors.red,size: 15,)),
            ),
            Positioned(
              top:0,
              right:0,
              child: CircleAvatar(
                radius:15,
                backgroundColor:AppColors.primaryColor,
                child: Icon(Icons.add_shopping_cart_outlined,
                  color: AppColors.secondaryColor,size: 15,),
              ),
            ),


          ],
        ),
      ),
    );;
  }
}
