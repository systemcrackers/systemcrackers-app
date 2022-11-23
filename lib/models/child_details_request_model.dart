class ChildDetailsRequestModel {
  ChildDetailsRequestModel({
    this.name,
    this.sex,
    this.dob,
    this.country,
  });
  late final String? name;
  late final String? sex;
  late final String? dob;
  late final String? country;

  ChildDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    dob = json['dob'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['sex'] = sex;
    _data['dob'] = dob;
    _data['country'] = country;
    return _data;
  }
}
