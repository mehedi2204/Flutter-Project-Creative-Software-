class InvoiceListModel {
  List<InvoiceList>? invoiceList;

  InvoiceListModel({this.invoiceList});

  InvoiceListModel.fromJson(Map<String, dynamic> json) {
    if (json['invoice_list'] != null) {
      invoiceList = <InvoiceList>[];
      json['invoice_list'].forEach((v) {
        invoiceList!.add(new InvoiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoiceList != null) {
      data['invoice_list'] = this.invoiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceList {
  int? id;
  String? invoiceNo;
  String? date;
  String? openTill;
  String? to;
  String? status;
  String? assigned;
  String? subject;
  String? businessName;
  String? address;
  String? currency;
  String? city;
  String? tag;
  String? country;
  String? subtotal;
  String? discount;
  String? discountType;
  String? discountAmount;
  String? vat;
  String? vatAmount;
  String? tax;
  String? taxAmount;
  String? total;
  String? createdAt;
  String? updatedAt;
  Currencies? currencies;
  Users? users;
  Customer? customer;
  Countries? countries;

  InvoiceList(
      {this.id,
        this.invoiceNo,
        this.date,
        this.openTill,
        this.to,
        this.status,
        this.assigned,
        this.subject,
        this.businessName,
        this.address,
        this.currency,
        this.city,
        this.tag,
        this.country,
        this.subtotal,
        this.discount,
        this.discountType,
        this.discountAmount,
        this.vat,
        this.vatAmount,
        this.tax,
        this.taxAmount,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.currencies,
        this.users,
        this.customer,
        this.countries});

  InvoiceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    date = json['date'];
    openTill = json['open_till'];
    to = json['to'];
    status = json['status'];
    assigned = json['assigned'];
    subject = json['subject'];
    businessName = json['business_name'];
    address = json['address'];
    currency = json['currency'];
    city = json['city'];
    tag = json['tag'];
    country = json['country'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    discountType = json['discount_type'];
    discountAmount = json['discount_amount'];
    vat = json['vat'];
    vatAmount = json['vat_amount'];
    tax = json['tax'];
    taxAmount = json['tax_amount'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currencies = json['currencies'] != null
        ? new Currencies.fromJson(json['currencies'])
        : null;
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
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
    data['invoice_no'] = this.invoiceNo;
    data['date'] = this.date;
    data['open_till'] = this.openTill;
    data['to'] = this.to;
    data['status'] = this.status;
    data['assigned'] = this.assigned;
    data['subject'] = this.subject;
    data['business_name'] = this.businessName;
    data['address'] = this.address;
    data['currency'] = this.currency;
    data['city'] = this.city;
    data['tag'] = this.tag;
    data['country'] = this.country;
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['discount_amount'] = this.discountAmount;
    data['vat'] = this.vat;
    data['vat_amount'] = this.vatAmount;
    data['tax'] = this.tax;
    data['tax_amount'] = this.taxAmount;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
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
  String? comment;
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
        this.comment,
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
    comment = json['comment'];
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
    data['comment'] = this.comment;
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
