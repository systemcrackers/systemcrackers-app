import 'dart:io';

import 'package:camera/camera.dart';

class DyslexiaRequestModel {
  DyslexiaRequestModel({required this.img, required this.pred});
  late final XFile img;
  late final String pred;

  DyslexiaRequestModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    pred = json['pred'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['img'] = img;
    _data['pred'] = pred;
    return _data;
  }
}
