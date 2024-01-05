class dpsCollectionReport {
  Company? company;
  Data? data;
  AmountPerInstallment? amountPerInstallment;

  dpsCollectionReport({this.company, this.data, this.amountPerInstallment});

  dpsCollectionReport.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    amountPerInstallment = json['amount_per_installment'] != null
        ? new AmountPerInstallment.fromJson(json['amount_per_installment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.amountPerInstallment != null) {
      data['amount_per_installment'] = this.amountPerInstallment!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? number;
  String? email;
  String? website;
  String? address;
  String? district;
  String? currencyType;
  String? logo;
  String? createdAt;
  String? updatedAt;

  Company(
      {this.id,
        this.name,
        this.number,
        this.email,
        this.website,
        this.address,
        this.district,
        this.currencyType,
        this.logo,
        this.createdAt,
        this.updatedAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    email = json['email'];
    website = json['website'];
    address = json['address'];
    district = json['district'];
    currencyType = json['currency_type'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['email'] = this.email;
    data['website'] = this.website;
    data['address'] = this.address;
    data['district'] = this.district;
    data['currency_type'] = this.currencyType;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Data {
  int? id;
  String? dpsCollectionNo;
  String? memberNo;
  String? monthlySavingNo;
  String? installmentCollection;
  String? installmentOverdue;
  String? fine;
  String? note;
  int? collectedBy;
  String? createdAt;
  String? updatedAt;
  Member? member;

  Data(
      {this.id,
        this.dpsCollectionNo,
        this.memberNo,
        this.monthlySavingNo,
        this.installmentCollection,
        this.installmentOverdue,
        this.fine,
        this.note,
        this.collectedBy,
        this.createdAt,
        this.updatedAt,
        this.member});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dpsCollectionNo = json['dps_collection_no'];
    memberNo = json['member_no'];
    monthlySavingNo = json['monthly_saving_no'];
    installmentCollection = json['installment_collection'];
    installmentOverdue = json['installment_overdue'];
    fine = json['fine'];
    note = json['note'];
    collectedBy = json['collected_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dps_collection_no'] = this.dpsCollectionNo;
    data['member_no'] = this.memberNo;
    data['monthly_saving_no'] = this.monthlySavingNo;
    data['installment_collection'] = this.installmentCollection;
    data['installment_overdue'] = this.installmentOverdue;
    data['fine'] = this.fine;
    data['note'] = this.note;
    data['collected_by'] = this.collectedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.member != null) {
      data['member'] = this.member!.toJson();
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

class AmountPerInstallment {
  int? amountPerInstallment;

  AmountPerInstallment({this.amountPerInstallment});

  AmountPerInstallment.fromJson(Map<String, dynamic> json) {
    amountPerInstallment = json['amount_per_installment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_per_installment'] = this.amountPerInstallment;
    return data;
  }
}
