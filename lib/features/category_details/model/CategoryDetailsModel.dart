class CategoryDetailsModel{
  final bool status;
  final String message;
  final CategoryDetailsList data;
  
  CategoryDetailsModel({ required this.status,
  required this.message,
  required this.data});

  factory CategoryDetailsModel.fromJson(Map<String,dynamic> json){
    return CategoryDetailsModel(
        status: json ['status'],
        message: json ['message']?? "",
        data: CategoryDetailsList.fromJson (json ['data']));
  }

}

class CategoryDetailsList{
  final int currentPage;
  final List<CategoryDetails> data;

  CategoryDetailsList({required this.data, required this.currentPage});

  factory CategoryDetailsList.fromJson(Map<String,dynamic> json){
    return CategoryDetailsList(
        data: List<CategoryDetails>.from( (json['data'] as List).map ((e)=>  CategoryDetails.fromJson(e))),
        currentPage: json['current_page']);
  }
}

class CategoryDetails{
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFav;
  final bool inCart;

  CategoryDetails({
      required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required  this.name,
    required this.description,
    required this.images,
    required  this.inFav,
    required this.inCart});

  factory CategoryDetails.fromJson(Map<String,dynamic> json){
    return CategoryDetails(
        id: json['id'],
        price: json ['price'],
        oldPrice: json ['old_price'],
        discount:json ['discount'],
        image:json ['image'],
        name:json ['name'],
        description:json ['description'],
        images:List<String>.from(json ['images']),
        inFav:json ['in_favorites'],
        inCart:json ['in_cart']);

  }

}


