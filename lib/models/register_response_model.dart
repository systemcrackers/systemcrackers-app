import 'dart:convert';

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({required this.message, required this.data});
  late final String message;
  late final Data? data;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    print(data);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.authEmailId,
    required this.user,
    required this.token,
    // required this.id,
  });
  late final dynamic? user;
  late final String? authEmailId;
  late final String? token;
  // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    authEmailId = json['authEmailId'];
    token = json['token'];

    // id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['authEmailId'] = authEmailId;
    _data['token'] = token;
    // _data['id'] = id;
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
    print(name);
    print(email);
    print(dateOfSignUp);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['dateOfSignUp'] = dateOfSignUp;
    return _data;
  }
}
