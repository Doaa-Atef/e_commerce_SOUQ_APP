import 'package:e_commerce_application/core/routes/routes.dart';
import 'package:e_commerce_application/features/categories/view_model/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CategoriesCubit()
        ..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if(state is CategoriesLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is CategoriesSuccess){
            return Scaffold(
          body: ListView.builder(
            itemCount: context.read<CategoriesCubit>().categoriesResponseModel.data.categories.length,
            itemBuilder:
              (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  final int id = context.read<CategoriesCubit>().categoriesResponseModel.data.categories[index].id;
                   Navigator.pushNamed(context, Routes.categoryDetailsScreen,arguments: id);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.network(context.read<CategoriesCubit>().categoriesResponseModel.data.categories[index].image,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10,),
                      Text(context.read<CategoriesCubit>().categoriesResponseModel.data.categories[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              );

          },),


            );
          }else if(state is CategoriesError){
            return Center(child: Text("Error"),);
          }else{
            return SizedBox();
          }

        },
      ),
    );
  }
}
