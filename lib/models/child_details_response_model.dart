import 'dart:convert';

ChildDetailsResponseModel childResponseJson(String str) =>
    ChildDetailsResponseModel.fromJson(json.decode(str));

class ChildDetailsResponseModel {
  ChildDetailsResponseModel({required this.message, required this.data});
  late final String message;
  late final Data? data;

  ChildDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
    required this.name,
    required this.sex,
    required this.dob,
    required this.country,
    // required this.id,
  });
  late final String name;
  late final String sex;
  late final String dob;
  late final String country;
  // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    dob = json['dob'];
    country = json['country'];
    // id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['sex'] = sex;
    _data['dob'] = dob;
    _data['country'] = country;
    // _data['id'] = id;
    return _data;
  }
}
