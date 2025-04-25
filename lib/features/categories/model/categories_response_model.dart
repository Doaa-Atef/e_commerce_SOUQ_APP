class CategoriesResponseModel {
  final bool status;
  final String? message;
  final CategoriesData data;

  CategoriesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      status: json['status'],
      message: json['message'],
      data: CategoriesData.fromJson(json['data']),
    );
  }
}

class CategoriesData {
  final int currentPage;
  final List<Category> categories;

  CategoriesData({
    required this.currentPage,
    required this.categories,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    return CategoriesData(
      currentPage: json['current_page'],
      categories: List<Category>.from(json['data'].map((x) => Category.fromJson(x))),
    );
  }
}



class Category{
  final int id;
  final String name;
  final String image;

  Category({required this.name, required this.id, required this.image});

  factory Category.fromJson(Map<String,dynamic> json){
    return Category(name: json['name'], id: json['id'], image: json['image']);
  }

}