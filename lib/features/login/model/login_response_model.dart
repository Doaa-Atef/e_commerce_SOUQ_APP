class LoginResponseModel{
  final bool status;
  final String message;
  final LoginResponseData? data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
});

  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(status: json['status'],
        message: json['message'],
        data: json['data']!=null?LoginResponseData.fromJson(json['data']):null);
  }
}

class LoginResponseData{
 final int id;
 final String name;
 final String email;
 final String phone;
 final String image;
 final int points;
 final int credit;
 final String token;


 LoginResponseData(
  {required this.token,
    required this.credit,
    required this.points,
    required this.image,
    required this.phone,
    required this.email,
    required this.name,
    required this.id});

 factory LoginResponseData.fromJson(Map<String,dynamic> json){
   return LoginResponseData(
     id:json['id'],
     name:json['name'],
     email:json['email'],
     phone:json['phone'],
     image:json['image'],
     points:json['points'],
     credit:json['credit'],
     token:json['token'],
   );
 }
}

