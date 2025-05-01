import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({super.key, required this.discount});

  final num discount;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: discount !=0,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text("$discount %off  ",style:
        TextStyle(fontSize: 15,
        ),),
      ),
    );
  }
}
