class ProductDetailsModelResponse{
final bool status;
final String message;
final ProductDetailsData? data;

ProductDetailsModelResponse({
     required this.status,
     required this.message,
     required  this.data});

 factory ProductDetailsModelResponse.fromJson({required Map<String,dynamic>json}){
   return ProductDetailsModelResponse(
       status: json ['status'] ?? false,
       message: json ['message'] ?? "حدث خطأ",
       data: json['data'] !=null? ProductDetailsData.fromJson(json:json['data']):null);
 }

}

class ProductDetailsData{
  final int id;
  final num price;
   final num oldPrice;
   final int discount;
   final String name;
   final String description;
   final bool inFav;
   final bool inCart;
   final List images;


   ProductDetailsData({
   required this.id,
   required this.price,
   required this.oldPrice,
   required this.discount,
   required this.name,
   required this.description,
   required this.inFav,
   required this.inCart,
   required this.images});

   factory ProductDetailsData.fromJson({required Map<String,dynamic> json}){
     return ProductDetailsData(
         id: json ['id'] ?? 0,
         price: json ['price'] ??0,
         oldPrice: json ['oldPrice']??0,
         discount: json ['discount']??0,
         name: json ['name']??"",
         description:json ['description']??"",
         inFav: json ['inFav']??false,
         inCart:json ['inCart']??false,
         images: json ['images']);
   }
}