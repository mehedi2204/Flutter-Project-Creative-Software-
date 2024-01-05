class callListModel {
  List<CallList>? callList;

  callListModel({this.callList});

  callListModel.fromJson(Map<String, dynamic> json) {
    if (json['call_list'] != null) {
      callList = <CallList>[];
      json['call_list'].forEach((v) {
        callList!.add(new CallList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.callList != null) {
      data['call_list'] = this.callList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CallList {
  int? id;
  String? businessName;
  String? address;
  String? mobileNo;
  String? displayReminder;
  String? direction;
  String? emailReminder;
  String? startDate;
  String? statTime;
  String? callType;
  String? duration;
  String? private;
  String? comment;
  String? status;
  String? followUpDate;
  String? followUpTime;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  CallList(
      {this.id,
        this.businessName,
        this.address,
        this.mobileNo,
        this.displayReminder,
        this.direction,
        this.emailReminder,
        this.startDate,
        this.statTime,
        this.callType,
        this.duration,
        this.private,
        this.comment,
        this.status,
        this.followUpDate,
        this.followUpTime,
        this.createdAt,
        this.updatedAt,
        this.customer});

  CallList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    address = json['address'];
    mobileNo = json['mobile_no'];
    displayReminder = json['display_reminder'];
    direction = json['direction'];
    emailReminder = json['email_reminder'];
    startDate = json['start_date'];
    statTime = json['stat_time'];
    callType = json['call_type'];
    duration = json['duration'];
    private = json['private'];
    comment = json['comment'];
    status = json['status'];
    followUpDate = json['follow_up_date'];
    followUpTime = json['follow_up_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_name'] = this.businessName;
    data['address'] = this.address;
    data['mobile_no'] = this.mobileNo;
    data['display_reminder'] = this.displayReminder;
    data['direction'] = this.direction;
    data['email_reminder'] = this.emailReminder;
    data['start_date'] = this.startDate;
    data['stat_time'] = this.statTime;
    data['call_type'] = this.callType;
    data['duration'] = this.duration;
    data['private'] = this.private;
    data['comment'] = this.comment;
    data['status'] = this.status;
    data['follow_up_date'] = this.followUpDate;
    data['follow_up_time'] = this.followUpTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? customerNo;
  String? companyId;
  String? customerGroupId;
  String? productId;
  String? businessName;
  String? customerName;
  String? businessRole;
  String? typeOfBusiness;
  String? tradeLicenseNo;
  String? businessIndustries;
  String? numberOfEmployees;
  String? businessAge;
  String? totalInvestment;
  String? mobileNo;
  String? secondaryMobileNo;
  String? email;
  String? website;
  String? gender;
  String? dateOfBirth;
  String? nidOrPassport;
  String? profession;
  String? religion;
  String? country;
  String? city;
  String? address;
  String? currency;
  String? language;
  String? leadStatus;
  String? status;
  String? assignedBy;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.customerNo,
        this.companyId,
        this.customerGroupId,
        this.productId,
        this.businessName,
        this.customerName,
        this.businessRole,
        this.typeOfBusiness,
        this.tradeLicenseNo,
        this.businessIndustries,
        this.numberOfEmployees,
        this.businessAge,
        this.totalInvestment,
        this.mobileNo,
        this.secondaryMobileNo,
        this.email,
        this.website,
        this.gender,
        this.dateOfBirth,
        this.nidOrPassport,
        this.profession,
        this.religion,
        this.country,
        this.city,
        this.address,
        this.currency,
        this.language,
        this.leadStatus,
        this.status,
        this.assignedBy,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerNo = json['customer_no'];
    companyId = json['company_id'];
    customerGroupId = json['customer_group_id'];
    productId = json['product_id'];
    businessName = json['business_name'];
    customerName = json['customer_name'];
    businessRole = json['business_role'];
    typeOfBusiness = json['type_of_business'];
    tradeLicenseNo = json['trade_license_no'];
    businessIndustries = json['business_industries'];
    numberOfEmployees = json['number_of_employees'];
    businessAge = json['business_age'];
    totalInvestment = json['total_investment'];
    mobileNo = json['mobile_no'];
    secondaryMobileNo = json['secondary_mobile_no'];
    email = json['email'];
    website = json['website'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    nidOrPassport = json['nid_or_passport'];
    profession = json['profession'];
    religion = json['religion'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    currency = json['currency'];
    language = json['language'];
    leadStatus = json['lead_status'];
    status = json['status'];
    assignedBy = json['assigned_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_no'] = this.customerNo;
    data['company_id'] = this.companyId;
    data['customer_group_id'] = this.customerGroupId;
    data['product_id'] = this.productId;
    data['business_name'] = this.businessName;
    data['customer_name'] = this.customerName;
    data['business_role'] = this.businessRole;
    data['type_of_business'] = this.typeOfBusiness;
    data['trade_license_no'] = this.tradeLicenseNo;
    data['business_industries'] = this.businessIndustries;
    data['number_of_employees'] = this.numberOfEmployees;
    data['business_age'] = this.businessAge;
    data['total_investment'] = this.totalInvestment;
    data['mobile_no'] = this.mobileNo;
    data['secondary_mobile_no'] = this.secondaryMobileNo;
    data['email'] = this.email;
    data['website'] = this.website;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['nid_or_passport'] = this.nidOrPassport;
    data['profession'] = this.profession;
    data['religion'] = this.religion;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['currency'] = this.currency;
    data['language'] = this.language;
    data['lead_status'] = this.leadStatus;
    data['status'] = this.status;
    data['assigned_by'] = this.assignedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
