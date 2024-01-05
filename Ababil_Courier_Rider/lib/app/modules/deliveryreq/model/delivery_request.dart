class DeliveryRequest {
  int? id;
  String? trackingId;
  dynamic userId;
  String? createdAt;
  String? updatedAt;
  dynamic orderId;
  String? customerName;
  dynamic customerEmail;
  String? customerPhone;
  String? customerAddress;
  String? shop;
  String? area;
  dynamic shopId;
  dynamic areaId;
  String? category;
  String? product;
  String? weight;
  dynamic collection;
  dynamic pickupDate;
  dynamic pickupTime;
  String? remarks;
  dynamic inside;
  String? district;
  dynamic deliveryNote;
  dynamic deliveryDate;
  String? type;
  String? signatureImage;
  dynamic confirmImage;
  String? status;
  dynamic isPartial;
  dynamic securityCode;
  dynamic districtId;
  dynamic zoneId;
  String? businessName;
  dynamic mCod;
  dynamic mDiscount;
  dynamic urDiscount;
  dynamic mInsurance;
  dynamic mReturnDiscount;
  dynamic createdBy;
  String? bType;
  String? name;
  String? email;
  String? mobile;
  String? address;
  dynamic photo;
  dynamic role;
  dynamic emailVerifiedAt;
  String? password;
  dynamic otpCode;
  dynamic otpCreatedTime;
  String? rememberToken;
  dynamic isVerified;
  String? merchant;

  DeliveryRequest(
      {this.id,
        this.trackingId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.orderId,
        this.customerName,
        this.customerEmail,
        this.customerPhone,
        this.customerAddress,
        this.shop,
        this.area,
        this.shopId,
        this.areaId,
        this.category,
        this.product,
        this.weight,
        this.collection,
        this.pickupDate,
        this.pickupTime,
        this.remarks,
        this.inside,
        this.district,
        this.deliveryNote,
        this.deliveryDate,
        this.type,
        this.signatureImage,
        this.confirmImage,
        this.status,
        this.isPartial,
        this.securityCode,
        this.districtId,
        this.zoneId,
        this.businessName,
        this.mCod,
        this.mDiscount,
        this.urDiscount,
        this.mInsurance,
        this.mReturnDiscount,
        this.createdBy,
        this.bType,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.photo,
        this.role,
        this.emailVerifiedAt,
        this.password,
        this.otpCode,
        this.otpCreatedTime,
        this.rememberToken,
        this.merchant,
        this.isVerified});

  DeliveryRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackingId = json['tracking_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    shop = json['shop'];
    area = json['area'];
    shopId = json['shop_id'];
    areaId = json['area_id'];
    category = json['category'];
    product = json['product'];
    weight = json['weight'];
    collection = json['collection'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
    remarks = json['remarks'];
    inside = json['inside'];
    district = json['district'];
    deliveryNote = json['delivery_note'];
    deliveryDate = json['delivery_date'];
    type = json['type'];
    signatureImage = json['signature_image'];
    confirmImage = json['confirm_image'];
    status = json['status'];
    isPartial = json['isPartial'];
    securityCode = json['security_code'];
    districtId = json['district_id'];
    zoneId = json['zone_id'];
    businessName = json['business_name'];
    mCod = json['m_cod'];
    mDiscount = json['m_discount'];
    urDiscount = json['ur_discount'];
    mInsurance = json['m_insurance'];
    mReturnDiscount = json['m_return_discount'];
    createdBy = json['created_by'];
    bType = json['b_type'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    photo = json['photo'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    otpCode = json['otp_code'];
    otpCreatedTime = json['otp_created_time'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    merchant = json['merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tracking_id'] = trackingId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_id'] = orderId;
    data['customer_name'] = customerName;
    data['customer_email'] = customerEmail;
    data['customer_phone'] = customerPhone;
    data['customer_address'] = customerAddress;
    data['shop'] = shop;
    data['area'] = area;
    data['shop_id'] = shopId;
    data['area_id'] = areaId;
    data['category'] = category;
    data['product'] = product;
    data['weight'] = weight;
    data['collection'] = collection;
    data['pickup_date'] = pickupDate;
    data['pickup_time'] = pickupTime;
    data['remarks'] = remarks;
    data['inside'] = inside;
    data['district'] = district;
    data['delivery_note'] = deliveryNote;
    data['delivery_date'] = deliveryDate;
    data['type'] = type;
    data['signature_image'] = signatureImage;
    data['confirm_image'] = confirmImage;
    data['status'] = status;
    data['isPartial'] = isPartial;
    data['security_code'] = securityCode;
    data['district_id'] = districtId;
    data['zone_id'] = zoneId;
    data['business_name'] = businessName;
    data['m_cod'] = mCod;
    data['m_discount'] = mDiscount;
    data['ur_discount'] = urDiscount;
    data['m_insurance'] = mInsurance;
    data['m_return_discount'] = mReturnDiscount;
    data['created_by'] = createdBy;
    data['b_type'] = bType;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['photo'] = photo;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['otp_code'] = otpCode;
    data['otp_created_time'] = otpCreatedTime;
    data['remember_token'] = rememberToken;
    data['is_verified'] = isVerified;
    data['merchant'] = merchant;
    return data;
  }
}


