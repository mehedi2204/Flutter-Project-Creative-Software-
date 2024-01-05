class SubscriptionModel {
  List<Customer>? customer;
  List<Currency>? currency;
  List<Subscription>? subscription;

  SubscriptionModel({this.customer, this.currency, this.subscription});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach((v) {
        customer!.add(new Customer.fromJson(v));
      });
    }
    if (json['currency'] != null) {
      currency = <Currency>[];
      json['currency'].forEach((v) {
        currency!.add(new Currency.fromJson(v));
      });
    }
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(new Subscription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.map((v) => v.toJson()).toList();
    }
    if (this.currency != null) {
      data['currency'] = this.currency!.map((v) => v.toJson()).toList();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
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

class Currency {
  int? id;
  String? name;
  String? code;
  String? symbol;
  String? createdAt;
  String? updatedAt;

  Currency(
      {this.id,
        this.name,
        this.code,
        this.symbol,
        this.createdAt,
        this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
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

class Subscription {
  int? id;
  String? subscriptionNo;
  String? businessName;
  String? title;
  String? product;
  String? plane;
  String? billAmount;
  String? paymentMode;
  String? paymentType;
  Currency? currency;
  String? firstBillingDate;
  String? billDueDate;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  Subscription(
      {this.id,
        this.subscriptionNo,
        this.businessName,
        this.title,
        this.product,
        this.plane,
        this.billAmount,
        this.paymentMode,
        this.paymentType,
        this.currency,
        this.firstBillingDate,
        this.billDueDate,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.customer});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriptionNo = json['subscription_no'];
    businessName = json['business_name'];
    title = json['title'];
    product = json['product'];
    plane = json['plane'];
    billAmount = json['bill_amount'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    firstBillingDate = json['first_billing_date'];
    billDueDate = json['bill_due_date'];
    attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subscription_no'] = this.subscriptionNo;
    data['business_name'] = this.businessName;
    data['title'] = this.title;
    data['product'] = this.product;
    data['plane'] = this.plane;
    data['bill_amount'] = this.billAmount;
    data['payment_mode'] = this.paymentMode;
    data['payment_type'] = this.paymentType;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['first_billing_date'] = this.firstBillingDate;
    data['bill_due_date'] = this.billDueDate;
    data['attachment'] = this.attachment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}
