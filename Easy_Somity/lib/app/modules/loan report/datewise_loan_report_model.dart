class datewiseLoanReport {
  String? status;
  List<Data>? data;

  datewiseLoanReport({this.status, this.data});

  datewiseLoanReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? installmentCollectionsNo;
  String? memberNo;
  String? loanNo;
  String? installmentCollection;
  String? previousDue;
  String? fine;
  String? note;
  int? collectedBy;
  String? createdAt;
  String? updatedAt;
  Member? member;
  User? user;

  Data(
      {this.id,
        this.installmentCollectionsNo,
        this.memberNo,
        this.loanNo,
        this.installmentCollection,
        this.previousDue,
        this.fine,
        this.note,
        this.collectedBy,
        this.createdAt,
        this.updatedAt,
        this.member,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    installmentCollectionsNo = json['installment_collections_no'];
    memberNo = json['member_no'];
    loanNo = json['loan_no'];
    installmentCollection = json['installment_collection'];
    previousDue = json['previous_due'];
    fine = json['fine'];
    note = json['note'];
    collectedBy = json['collected_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['installment_collections_no'] = this.installmentCollectionsNo;
    data['member_no'] = this.memberNo;
    data['loan_no'] = this.loanNo;
    data['installment_collection'] = this.installmentCollection;
    data['previous_due'] = this.previousDue;
    data['fine'] = this.fine;
    data['note'] = this.note;
    data['collected_by'] = this.collectedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Member {
  int? id;
  String? memberNo;
  String? branchId;
  String? areaId;
  String? somityId;
  Null? otpCode;
  String? memberName;
  String? mobileNo;
  String? secondaryMobileNo;
  String? membersFatherName;
  String? membersMotherName;
  String? spouseName;
  String? gender;
  String? email;
  String? dob;
  String? memberNidNo;
  String? fatherNidNo;
  String? spouseNidNo;
  String? profession;
  String? religion;
  String? typeOfBusiness;
  String? businessName;
  String? businessAddress;
  String? tradeLicenseNo;
  String? natureOfBusiness;
  String? numberOfEmployee;
  String? totalInvestment;
  String? currentVillage;
  String? currentPostOffice;
  String? currentThana;
  String? currentDistrict;
  String? permanentVillage;
  String? permanentPostOffice;
  String? permanentThana;
  String? permanentDistrict;
  String? status;
  String? createdAt;
  String? updatedAt;

  Member(
      {this.id,
        this.memberNo,
        this.branchId,
        this.areaId,
        this.somityId,
        this.otpCode,
        this.memberName,
        this.mobileNo,
        this.secondaryMobileNo,
        this.membersFatherName,
        this.membersMotherName,
        this.spouseName,
        this.gender,
        this.email,
        this.dob,
        this.memberNidNo,
        this.fatherNidNo,
        this.spouseNidNo,
        this.profession,
        this.religion,
        this.typeOfBusiness,
        this.businessName,
        this.businessAddress,
        this.tradeLicenseNo,
        this.natureOfBusiness,
        this.numberOfEmployee,
        this.totalInvestment,
        this.currentVillage,
        this.currentPostOffice,
        this.currentThana,
        this.currentDistrict,
        this.permanentVillage,
        this.permanentPostOffice,
        this.permanentThana,
        this.permanentDistrict,
        this.status,
        this.createdAt,
        this.updatedAt});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberNo = json['member_no'];
    branchId = json['branch_id'];
    areaId = json['area_id'];
    somityId = json['somity_id'];
    otpCode = json['otp_code'];
    memberName = json['member_name'];
    mobileNo = json['mobile_no'];
    secondaryMobileNo = json['secondary_mobile_no'];
    membersFatherName = json['members_father_name'];
    membersMotherName = json['members_mother_name'];
    spouseName = json['spouse_name'];
    gender = json['gender'];
    email = json['email'];
    dob = json['dob'];
    memberNidNo = json['member_nid_no'];
    fatherNidNo = json['father_nid_no'];
    spouseNidNo = json['spouse_nid_no'];
    profession = json['profession'];
    religion = json['religion'];
    typeOfBusiness = json['type_of_business'];
    businessName = json['business_name'];
    businessAddress = json['business_address'];
    tradeLicenseNo = json['trade_license_no'];
    natureOfBusiness = json['nature_of_business'];
    numberOfEmployee = json['number_of_employee'];
    totalInvestment = json['total_investment'];
    currentVillage = json['current_village'];
    currentPostOffice = json['current_post_office'];
    currentThana = json['current_thana'];
    currentDistrict = json['current_district'];
    permanentVillage = json['permanent_village'];
    permanentPostOffice = json['permanent_post_office'];
    permanentThana = json['permanent_thana'];
    permanentDistrict = json['permanent_district'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_no'] = this.memberNo;
    data['branch_id'] = this.branchId;
    data['area_id'] = this.areaId;
    data['somity_id'] = this.somityId;
    data['otp_code'] = this.otpCode;
    data['member_name'] = this.memberName;
    data['mobile_no'] = this.mobileNo;
    data['secondary_mobile_no'] = this.secondaryMobileNo;
    data['members_father_name'] = this.membersFatherName;
    data['members_mother_name'] = this.membersMotherName;
    data['spouse_name'] = this.spouseName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['member_nid_no'] = this.memberNidNo;
    data['father_nid_no'] = this.fatherNidNo;
    data['spouse_nid_no'] = this.spouseNidNo;
    data['profession'] = this.profession;
    data['religion'] = this.religion;
    data['type_of_business'] = this.typeOfBusiness;
    data['business_name'] = this.businessName;
    data['business_address'] = this.businessAddress;
    data['trade_license_no'] = this.tradeLicenseNo;
    data['nature_of_business'] = this.natureOfBusiness;
    data['number_of_employee'] = this.numberOfEmployee;
    data['total_investment'] = this.totalInvestment;
    data['current_village'] = this.currentVillage;
    data['current_post_office'] = this.currentPostOffice;
    data['current_thana'] = this.currentThana;
    data['current_district'] = this.currentDistrict;
    data['permanent_village'] = this.permanentVillage;
    data['permanent_post_office'] = this.permanentPostOffice;
    data['permanent_thana'] = this.permanentThana;
    data['permanent_district'] = this.permanentDistrict;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  String? languageCode;
  Null? otpCode;
  String? status;
  Null? emailVerifiedAt;
  String? password;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.roleId,
        this.languageCode,
        this.otpCode,
        this.status,
        this.emailVerifiedAt,
        this.password,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    languageCode = json['language_code'];
    otpCode = json['otp_code'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    data['language_code'] = this.languageCode;
    data['otp_code'] = this.otpCode;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
