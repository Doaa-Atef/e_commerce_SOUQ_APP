import 'package:flutter/material.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../product_details/product_details_args.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.image, required this.name, required this.price, required this.productId,  this.discount = 0,});
  final String image;
  final String name;
  final num price;
  final int productId;
  final int discount;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){

        Navigator.pushNamed(context, Routes.productDetails,
        arguments: ProductDetailsArgs(productId: productId),
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
                Image.network(image,
                  height: 125,
                  width: 125,),
                Divider(),
                Text(name,
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
