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
    required this.child,
    // required this.id,
  });
  late final dynamic child;
  // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    child = json['child'];
    // id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['child'] = child;
    // _data['id'] = id;
    return _data;
  }
}
