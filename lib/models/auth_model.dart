import 'package:recipley/models/parent/model.dart';


///
///Authentication Model
///
class AuthenticationModel extends Model {
  String? email;
  String? password;
  String? uID;

  AuthenticationModel({this.email, this.password,this.uID});

  AuthenticationModel.fromJson(Map<String, dynamic> json,id) {

    email = stringFromJson(json, 'email');
    password = stringFromJson(json, 'password');
    uID = id;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['uID']=uID;
    return data;
  }
}