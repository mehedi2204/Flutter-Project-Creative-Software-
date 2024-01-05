class RiderInfoResponse {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? photo;
  dynamic role;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  RiderInfoResponse(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.photo,
      this.role,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  RiderInfoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    photo = json['photo'];
    role = int.parse(json['role']);
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['photo'] = photo;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
