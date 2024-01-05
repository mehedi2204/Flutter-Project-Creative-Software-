class PickupAssignModel {
  List<PickupAssign>? data;
  List<Merchants>? merchants;

  PickupAssignModel({this.data, this.merchants});

  PickupAssignModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PickupAssign>[];
      json['data'].forEach((v) {
        data!.add(new PickupAssign.fromJson(v));
      });
    }
    if (json['merchants'] != null) {
      merchants = <Merchants>[];
      json['merchants'].forEach((v) {
        merchants!.add(new Merchants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.merchants != null) {
      data['merchants'] = this.merchants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PickupAssign {
  int? id;
  int? userId;
  String? trackingId;
  Null? orderId;
  String? customerName;
  Null? customerEmail;
  String? customerPhone;
  Null? otherNumber;
  String? customerAddress;
  String? shop;
  String? area;
  int? shopId;
  int? areaId;
  String? category;
  Null? product;
  String? weight;
  int? sellingPrice;
  int? collection;
  String? pickupDate;
  String? pickupTime;
  Null? remarks;
  int? inside;
  String? district;
  Null? deliveryNote;
  Null? deliveryDate;
  String? type;
  String? status;
  Null? returnCode;
  Null? isPartial;
  Null? securityCode;
  String? createdAt;
  String? updatedAt;
  int? districtId;
  int? zoneId;
  String? businessName;
  int? mCod;
  int? mDiscount;
  int? urDiscount;
  int? mInsurance;
  int? mReturnDiscount;
  int? createdBy;
  String? bType;
  String? mobile;
  String? address;
  int? merchantId;

  PickupAssign(
      {this.id,
        this.userId,
        this.trackingId,
        this.orderId,
        this.customerName,
        this.customerEmail,
        this.customerPhone,
        this.otherNumber,
        this.customerAddress,
        this.shop,
        this.area,
        this.shopId,
        this.areaId,
        this.category,
        this.product,
        this.weight,
        this.sellingPrice,
        this.collection,
        this.pickupDate,
        this.pickupTime,
        this.remarks,
        this.inside,
        this.district,
        this.deliveryNote,
        this.deliveryDate,
        this.type,
        this.status,
        this.returnCode,
        this.isPartial,
        this.securityCode,
        this.createdAt,
        this.updatedAt,
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
        this.mobile,
        this.address,
        this.merchantId});

  PickupAssign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    trackingId = json['tracking_id'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    otherNumber = json['other_number'];
    customerAddress = json['customer_address'];
    shop = json['shop'];
    area = json['area'];
    shopId = json['shop_id'];
    areaId = json['area_id'];
    category = json['category'];
    product = json['product'];
    weight = json['weight'];
    sellingPrice = json['selling_price'];
    collection = json['collection'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
    remarks = json['remarks'];
    inside = json['inside'];
    district = json['district'];
    deliveryNote = json['delivery_note'];
    deliveryDate = json['delivery_date'];
    type = json['type'];
    status = json['status'];
    returnCode = json['return_code'];
    isPartial = json['isPartial'];
    securityCode = json['security_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    mobile = json['mobile'];
    address = json['address'];
    merchantId = json['merchant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['tracking_id'] = this.trackingId;
    data['order_id'] = this.orderId;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['other_number'] = this.otherNumber;
    data['customer_address'] = this.customerAddress;
    data['shop'] = this.shop;
    data['area'] = this.area;
    data['shop_id'] = this.shopId;
    data['area_id'] = this.areaId;
    data['category'] = this.category;
    data['product'] = this.product;
    data['weight'] = this.weight;
    data['selling_price'] = this.sellingPrice;
    data['collection'] = this.collection;
    data['pickup_date'] = this.pickupDate;
    data['pickup_time'] = this.pickupTime;
    data['remarks'] = this.remarks;
    data['inside'] = this.inside;
    data['district'] = this.district;
    data['delivery_note'] = this.deliveryNote;
    data['delivery_date'] = this.deliveryDate;
    data['type'] = this.type;
    data['status'] = this.status;
    data['return_code'] = this.returnCode;
    data['isPartial'] = this.isPartial;
    data['security_code'] = this.securityCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['district_id'] = this.districtId;
    data['zone_id'] = this.zoneId;
    data['business_name'] = this.businessName;
    data['m_cod'] = this.mCod;
    data['m_discount'] = this.mDiscount;
    data['ur_discount'] = this.urDiscount;
    data['m_insurance'] = this.mInsurance;
    data['m_return_discount'] = this.mReturnDiscount;
    data['created_by'] = this.createdBy;
    data['b_type'] = this.bType;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['merchant_id'] = this.merchantId;
    return data;
  }
}

class Merchants {
  int? id;
  String? merchantname;

  Merchants({this.id, this.merchantname});

  Merchants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantname = json['merchantname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merchantname'] = this.merchantname;
    return data;
  }
}
