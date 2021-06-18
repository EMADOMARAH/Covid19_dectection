class UserModel
{
  String name;
  String email;
  String phone;
  String uId;
  bool isUser;

  UserModel({this.name, this.email, this.phone, this.uId , this.isUser});

  UserModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    isUser = json["isUser"];
  }

  Map<String , dynamic> toMap()
  {
    return{
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uId' : uId,
      'isUser' : isUser,

    };

  }



}