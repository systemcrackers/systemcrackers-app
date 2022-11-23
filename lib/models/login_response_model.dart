import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({required this.data});
  // late final String message;
  late final Data? data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    // message = json['message'];
    data =json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.user,
    required this.token,
  });
  late final dynamic user;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.dateOfSignUp,
  });
  late final String? name;
  late final String? email;
  late final String? dateOfSignUp;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    dateOfSignUp = json['dateOfSignUp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['dateOfSignUp'] = dateOfSignUp;
    return _data;
  }
}
