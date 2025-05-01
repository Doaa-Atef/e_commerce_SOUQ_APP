import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/core/styles/app_colors.dart';
import 'package:e_commerce_application/features/product_details/view_model/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../../shared/widgets/discount_item.dart';
import '../../product_details_args.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productDetailsArgs, });
 final ProductDetailsArgs productDetailsArgs;
  @override

  Widget build(BuildContext context) {
   return BlocProvider(
  create: (context) => ProductDetailsCubit()..getProductDetails(productId: productDetailsArgs.productId),
  child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),centerTitle: true,
          
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is ProductDetailsSuccess) {

              return SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: context
                          .read<ProductDetailsCubit>()
                          .productDetailsModelResponse
                          .data!.images.length,
                      itemBuilder: (BuildContext context, int index,
                          int realIndex) {
                        return Image.network(context
                            .read<ProductDetailsCubit>()
                            .productDetailsModelResponse
                            .data!.images[index],
                          fit: BoxFit.fill,
                        );
                      },
                      options: CarouselOptions(
                          height: 200,
                          autoPlay: true
                      ),),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(context
                                    .read<ProductDetailsCubit>()
                                    .productDetailsModelResponse
                                    .data!.name,

                                  style: TextStyle(fontSize: 17,
                                fontWeight: FontWeight.w700),),
                              ),
                              IconButton(onPressed: (){}, icon:
                              Icon(Icons.favorite_border_rounded,color: Colors.red,),),

                              IconButton(onPressed: (){}, icon:
                              Icon(Icons.add_shopping_cart,color: AppColors.secondaryColor,),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          Row(
                            children: [
                              Text("${context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.price} EGP  ",style:
                              TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                              SizedBox(width: 10,),

                              Visibility(
                                visible: context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.discount !=0,
                                child: Row(
                                  children: [
                                    Text("${context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.oldPrice} EGP  ",style:
                                      TextStyle(fontSize: 15,color: Colors.red,
                                      decoration: TextDecoration.lineThrough,),),
                                    SizedBox(width: 10,),

                                    DiscountItem(discount:  context
                                        .read<ProductDetailsCubit>()
                                        .productDetailsModelResponse
                                        .data!.discount,),

                                  ],
                                ),
                              ),

                            ],
                          ),
                          Divider(),
                          Text("Description"
                                  ,style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.w700),
                          ),

                          ReadMoreText(
                            context
                                .read<ProductDetailsCubit>()
                                .productDetailsModelResponse
                                .data!.description,
                            trimMode: TrimMode.Line,
                            trimLines: 15,
                            colorClickableText: Colors.blueAccent,
                            trimCollapsedText: "Show more",
                            trimExpandedText:"Show less",
                            moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),

                          ),

                        ],
                      ),
                    )
                  ],
                ),
              );
            }else if(state is ProductDetailsError){
              return Center(child: Text(state.message));
            }
            else{
              return SizedBox();
            }
          },
        ),

      ),
);
  }
}
