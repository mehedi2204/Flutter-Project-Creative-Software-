class RiderProfileInfo {
  User? user;
  Rider? rider;

  RiderProfileInfo({this.user, this.rider});

  RiderProfileInfo.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rider = json['rider'] != null ? Rider.fromJson(json['rider']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (rider != null) {
      data['rider'] = rider!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  dynamic address;
  dynamic photo;
  int? role;
  dynamic emailVerifiedAt;
  dynamic otpCode;
  dynamic otpCreatedTime;
  int? isVerified;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.photo,
      this.role,
      this.emailVerifiedAt,
      this.otpCode,
      this.otpCreatedTime,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    photo = json['photo'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    otpCode = json['otp_code'];
    otpCreatedTime = json['otp_created_time'];
    isVerified = json['is_verified'];
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
    data['otp_code'] = otpCode;
    data['otp_created_time'] = otpCreatedTime;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Rider {
  int? id;
  int? userId;
  int? districtId;
  int? zoneId;
  String? district;
  String? area;
  int? isComission;
  dynamic rDeliveryCharge;
  dynamic rPickupCharge;
  dynamic rReturnCharge;
  dynamic presentAddress;
  dynamic permanentAddress;
  dynamic fathersName;
  dynamic fathersPhoneNo;
  dynamic userVoterIdNo;
  dynamic fathersVoterIdNo;
  dynamic userVoterIdPhoto;
  dynamic userFathersVoterIdPhoto;
  String? createdAt;
  String? updatedAt;

  Rider(
      {this.id,
      this.userId,
      this.districtId,
      this.zoneId,
      this.district,
      this.area,
      this.isComission,
      this.rDeliveryCharge,
      this.rPickupCharge,
      this.rReturnCharge,
      this.presentAddress,
      this.permanentAddress,
      this.fathersName,
      this.fathersPhoneNo,
      this.userVoterIdNo,
      this.fathersVoterIdNo,
      this.userVoterIdPhoto,
      this.userFathersVoterIdPhoto,
      this.createdAt,
      this.updatedAt});

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    districtId = json['district_id'];
    zoneId = json['zone_id'];
    district = json['district'];
    area = json['area'];
    isComission = json['isComission'];
    rDeliveryCharge = json['r_delivery_charge'];
    rPickupCharge = json['r_pickup_charge'];
    rReturnCharge = json['r_return_charge'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    fathersName = json['fathers_name'];
    fathersPhoneNo = json['fathers_phone_no'];
    userVoterIdNo = json['user_voter_id_no'];
    fathersVoterIdNo = json['fathers_voter_id_no'];
    userVoterIdPhoto = json['user_voter_id_photo'];
    userFathersVoterIdPhoto = json['user_fathers_voter_id_photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['district_id'] = districtId;
    data['zone_id'] = zoneId;
    data['district'] = district;
    data['area'] = area;
    data['isComission'] = isComission;
    data['r_delivery_charge'] = rDeliveryCharge;
    data['r_pickup_charge'] = rPickupCharge;
    data['r_return_charge'] = rReturnCharge;
    data['present_address'] = presentAddress;
    data['permanent_address'] = permanentAddress;
    data['fathers_name'] = fathersName;
    data['fathers_phone_no'] = fathersPhoneNo;
    data['user_voter_id_no'] = userVoterIdNo;
    data['fathers_voter_id_no'] = fathersVoterIdNo;
    data['user_voter_id_photo'] = userVoterIdPhoto;
    data['user_fathers_voter_id_photo'] = userFathersVoterIdPhoto;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
