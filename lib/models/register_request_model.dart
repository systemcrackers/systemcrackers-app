class RegisterRequestModel {
  RegisterRequestModel({
    required this.email,
    required this.username,
    required this.password,
  });
  late final String email;
  late final String username;
  late final String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }
}
