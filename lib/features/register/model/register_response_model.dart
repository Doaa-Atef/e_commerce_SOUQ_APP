class RegisterResponseModel{
  final bool status;
  final String message;
  final RegisterResponseData? data;
  
  RegisterResponseModel(
      {
        required this.status,
        required this.message,
        required this.data,
      });
  factory RegisterResponseModel.fromJson(Map<String,dynamic>json){
    return RegisterResponseModel(status: json['status'],
        message: json['message'],
        data: json['data']!=null?RegisterResponseData.fromJson(json['data']):null);
  }
}

class RegisterResponseData{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;

  final String token;

 RegisterResponseData({ 
   required this.id,
   required this.name,
   required this.email,
   required this.phone,
   required this.image,
   required this.token});
 
 
 factory RegisterResponseData.fromJson(Map<String,dynamic> json){
   return RegisterResponseData(
       id: json['id'],
       name: json['name'],
       email: json['email'],
       phone: json['phone'],
       image: json ['image'],
       token: json ['token']);
 }
}
