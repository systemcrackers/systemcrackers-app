class RegisterRequestModel {
  RegisterRequestModel({
    required this.body,
  });
  late final RegisterBody body;
  
  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    body = RegisterBody.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    // final _data = <String, dynamic>{};
    // _data['name'] = body.toJson();
    // return _data;
    final _data = <String, dynamic>{};
    _data['body'] = body.toJson();
    _data['body']['name'] = body.name;
    _data['body']['email'] = body.email;
    _data['body']['password'] = body.password;
    return _data;
  }
}

class RegisterBody {
  RegisterBody({
    required this.name,
    required this.email,
    required this.password,
  });
  late final String name;
  late final String email;
  late final String password;
  
  RegisterBody.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}