class LeadListModel {
  List<LeadList>? leadList;

  LeadListModel({this.leadList});

  LeadListModel.fromJson(Map<String, dynamic> json) {
    if (json['lead_list'] != null) {
      leadList = <LeadList>[];
      json['lead_list'].forEach((v) {
        leadList!.add(new LeadList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leadList != null) {
      data['lead_list'] = this.leadList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeadList {
  int? id;
  String? leadNo;
  String? businessName;
  String? customerName;
  String? mobileNo;
  String? email;
  String? country;
  String? address;
  String? currency;
  String? leadSources;
  String? language;
  String? status;
  String? companyId;
  String? productId;
  String? customerGroup;
  String? assignTo;
  String? createdAt;
  String? updatedAt;
  Users? users;
  Product? product;
  Currencies? currencies;
  ClientGroup? clientGroup;
  Company? company;
  Languages? languages;
  Customer? customer;
  Countries? countries;

  LeadList(
      {this.id,
        this.leadNo,
        this.businessName,
        this.customerName,
        this.mobileNo,
        this.email,
        this.country,
        this.address,
        this.currency,
        this.leadSources,
        this.language,
        this.status,
        this.companyId,
        this.productId,
        this.customerGroup,
        this.assignTo,
        this.createdAt,
        this.updatedAt,
        this.users,
        this.product,
        this.currencies,
        this.clientGroup,
        this.company,
        this.languages,
        this.customer,
        this.countries});

  LeadList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadNo = json['lead_no'];
    businessName = json['business_name'];
    customerName = json['customer_name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    country = json['country'];
    address = json['address'];
    currency = json['currency'];
    leadSources = json['lead_sources'];
    language = json['language'];
    status = json['status'];
    companyId = json['company_id'];
    productId = json['product_id'];
    customerGroup = json['customer_group'];
    assignTo = json['assign_to'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    currencies = json['currencies'] != null
        ? new Currencies.fromJson(json['currencies'])
        : null;
    clientGroup = json['client_group'] != null
        ? new ClientGroup.fromJson(json['client_group'])
        : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    languages = json['languages'] != null
        ? new Languages.fromJson(json['languages'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    countries = json['countries'] != null
        ? new Countries.fromJson(json['countries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_no'] = this.leadNo;
    data['business_name'] = this.businessName;
    data['customer_name'] = this.customerName;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['country'] = this.country;
    data['address'] = this.address;
    data['currency'] = this.currency;
    data['lead_sources'] = this.leadSources;
    data['language'] = this.language;
    data['status'] = this.status;
    data['company_id'] = this.companyId;
    data['product_id'] = this.productId;
    data['customer_group'] = this.customerGroup;
    data['assign_to'] = this.assignTo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.toJson();
    }
    if (this.clientGroup != null) {
      data['client_group'] = this.clientGroup!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  String? languageCode;
  String? otpCode;
  String? status;
  String? emailVerifiedAt;
  String? password;
  String? createdAt;
  String? updatedAt;

  Users(
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

  Users.fromJson(Map<String, dynamic> json) {
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

class Product {
  int? id;
  String? productName;
  String? productDescription;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.productName,
        this.productDescription,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Currencies {
  int? id;
  String? name;
  String? code;
  String? symbol;
  String? createdAt;
  String? updatedAt;

  Currencies(
      {this.id,
        this.name,
        this.code,
        this.symbol,
        this.createdAt,
        this.updatedAt});

  Currencies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ClientGroup {
  int? id;
  String? clientGroupName;
  String? clientGroupDescription;
  String? createdAt;
  String? updatedAt;

  ClientGroup(
      {this.id,
        this.clientGroupName,
        this.clientGroupDescription,
        this.createdAt,
        this.updatedAt});

  ClientGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientGroupName = json['client_group_name'];
    clientGroupDescription = json['client_group_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_group_name'] = this.clientGroupName;
    data['client_group_description'] = this.clientGroupDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Languages {
  int? id;
  String? name;
  String? name1;
  String? code;
  String? createdAt;
  String? updatedAt;

  Languages(
      {this.id,
        this.name,
        this.name1,
        this.code,
        this.createdAt,
        this.updatedAt});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name1 = json['name_1'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_1'] = this.name1;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Countries {
  int? id;
  String? code;
  String? name;

  Countries({this.id, this.code, this.name});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
