import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../features/product_details/product_details_args.dart';
import 'discount_item.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.image, required this.name, required this.price, required this.productId,  this.discount = 0, });
  final String image;
  final String name;
  final num price;
  final int productId;
  final int discount;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.productDetails,
            arguments: ProductDetailsArgs(productId: widget.productId),
          );
        },
        child: Container(
          margin: EdgeInsets.all(5),
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
                  SizedBox(height: 20),
                  Image.network(
                    widget.image,
                    height: 125,
                    width: 125,
                  ),
                  Divider(),
                  Text(
                    "${widget.price} EGP",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  DiscountItem(discount: widget.discount),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                      color: Colors.red,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                           });

                    },
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: AppColors.secondaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
  // Widget build(BuildContext context) {
  //   return InkWell(
  //     onTap: (){
  //       Navigator.pushNamed(context, Routes.productDetails,
  //         arguments: ProductDetailsArgs(productId: widget.productId),
  //       );
  //     },
  //     child: Container(
  //       margin: EdgeInsets.all(5),
  //       padding: EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(),
  //         color: AppColors.primaryColor.withOpacity(0.1),
  //       ),
  //       child: Stack(
  //         children: [
  //           Column(
  //             children: [
  //               SizedBox(height: 20,),
  //                   Image.network(widget.image,
  //                     height: 125,
  //                     width: 125,),
  //               Divider(),
  //               Text("${widget.price} EGP",
  //                 maxLines: 2,
  //                 textAlign: TextAlign.center,
  //               ),
  //               Text(widget.name,
  //                 maxLines: 2,
  //                 textAlign: TextAlign.center,),
  //               SizedBox(height: 10,),
  //
  //               DiscountItem(discount: widget.discount,)
  //
  //             ],
  //           ),
  //           Positioned(
  //             top:0,
  //             left:0,
  //             child: CircleAvatar(
  //                 radius: 18,
  //                 backgroundColor: AppColors.primaryColor,
  //                 child: IconButton(
  //                 icon: Icon(
  //                 isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
  //             color: Colors.red, size: 18,
  //             ),
  //             onPressed: () {
  //               setState(() {
  //                 isFavorite = !isFavorite;
  //               });
  //               context.read<FavoritesCubit>().toggleFavorite(widget.productId);
  //             },
  //           )),
  //           ),
  //           Positioned(
  //             top:0,
  //             right:0,
  //             child: CircleAvatar(
  //               radius:18,
  //               backgroundColor:AppColors.primaryColor,
  //               child: Icon(Icons.add_shopping_cart_outlined,
  //                 color: AppColors.secondaryColor,size: 18,),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
