class UserModel {
  UserModel({
    required this.data,
    required this.accessToken,
    required this.tokenType,
  });
  late final Data data;
  late final String accessToken;
  late final String tokenType;

  UserModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.roleId,
    required this.languageCode,
    //this.otpCode,
    required this.status,
    //this.emailVerifiedAt,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String mobile;
  late final String email;
  late final int roleId;
  late final String languageCode;
  //String? otpCode;
  late final String status;
  //String? emailVerifiedAt;
  late final String password;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    languageCode = json['language_code'];
    //otpCode = null;
    status = json['status'];
    //emailVerifiedAt = null;
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['role_id'] = roleId;
    _data['language_code'] = languageCode;
    //_data['otp_code'] = otpCode;
    _data['status'] = status;
    //_data['email_verified_at'] = emailVerifiedAt;
    _data['password'] = password;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
