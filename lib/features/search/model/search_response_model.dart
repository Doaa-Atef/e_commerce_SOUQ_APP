class SearchResponseModel{
  final bool status;
  final String message;
  final SearchData searchData;
  SearchResponseModel({
    required this.status,
    required this.message,
    required this.searchData,
  });

  factory SearchResponseModel.fromJson({required Map<String,dynamic> json}){
    return SearchResponseModel(
        status: json["status"],
        message: json["message"]??"",
        searchData: SearchData.fromJson(json:json ["data"])
    );
  }
}

class SearchData{
  final int total;
  List<SearchProducts> searchProducts;
  SearchData({ required this.total,
    required this.searchProducts
  });

  factory SearchData.fromJson({required Map<String,dynamic> json}){
    return SearchData(
      total: json['total'],
        searchProducts: (json["data"] as List<dynamic>).map((e)=>
            SearchProducts.fromJson (json: e as Map<String,dynamic>)).toList()
    );
  }
}


class SearchProducts {
  final int id;
  final num price;
  final String image;
  final String name;
  final bool inFav;
  final bool inCart;

  SearchProducts({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.inFav,
    required this.inCart,
  }
      );

  factory SearchProducts.fromJson({required Map<String,dynamic>json })
  {
    return SearchProducts(
        id: json["id"],
        price: json["price"],

        image: json["image"],
        name: json["name"],
        inFav: json["in_favorites"],
        inCart: json["in_cart"]
    );

  }

}