


class UserModel {
  String userId;
  String firstName;
  String second_name;
  String email;
  String city;
  String phone;
  String about;
  UserModel(
      {this.userId,
        this.firstName,
        this.second_name,
        this.email,
        this.about,
        this.phone,
        this.city});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) =>
      _UserModelFromJson(json);

  Map<String, dynamic> toJson() => _UserModelToJson(this);

  @override
  bool operator ==(Object other) {
    var user = other as UserModel;
    return user == null ? false : user.userId == userId;
  }
}

UserModel _UserModelFromJson(Map<dynamic, dynamic> json) {
  return UserModel(
    userId: json['userId'] as String,
    firstName: json['firstName'] as String,
    second_name: json['lastName'] as String,
    city: json['interests'] as String,
  );
}

Map<String, dynamic> _UserModelToJson(UserModel instance) => <String, dynamic>{
  'userId': instance.userId,
  'firstName': instance.firstName,
  'second_name': instance.second_name,
  'locality': instance.city,
  'phone': instance.phone,
  'about': instance.about,
  'email': instance.email,
};
