import 'dart:convert';

DyslexiaModel dyslexiaModelFromJson(String str) =>
    DyslexiaModel.fromJson(json.decode(str));

class DyslexiaModel {
  DyslexiaModel({required this.pred});

  final String pred;

  DyslexiaModel.fromJson(Map<String, dynamic> json) : pred = json["pred"];

  String toJson() => pred;
}
