import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/home_cubit.dart';

class BannersList extends StatelessWidget {
  const BannersList({super.key});

  @override
  Widget build(BuildContext context) {
    return
     CarouselSlider.builder(
        itemCount:  context.read<HomeCubit>().homeResponseModel.homeData.homeBanners.length,
        itemBuilder: (BuildContext context,int index, int realIndex){
          return Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(context.read<HomeCubit>().homeResponseModel.homeData.homeBanners[index].image,height: 150,
                fit: BoxFit.fill,),
            ),
          );
        },
        options:CarouselOptions(
          height: 200,
        ) ,
      );
  ;
  }
}
