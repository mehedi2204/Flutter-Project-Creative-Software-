class OrderResponse {
  List<ConfirmOrderReportData>? order;
  int? Qty;
  int? Total;

  OrderResponse({this.Qty, this.order, this.Total});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['order'] != null) {
      order = <ConfirmOrderReportData>[];
      json['order'].forEach((v) {
        order!.add(ConfirmOrderReportData.fromJson(v));
      });
    }
    Qty = json['Qty'];
    Total = json['Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Qty'] = Qty;
    if (order != null) {
      data['order'] = order!.map((v) => v.toJson()).toList();
    }
    data['Total'] = Total;
    return data;
  }
}

class ConfirmOrderReportData {
  num? id;
  num? userId;
  String? trackingId;
  dynamic? orderId;
  String? customerName;
  dynamic customerEmail;
  int? customerPhone;
  String? customerAddress;
  String? shop;
  dynamic agentId;
  String? area;
  String? shopId;
  String? areaId;
  String? category;
  String? product;
  dynamic confirmImage;
  dynamic signatureImage;
  num? weight;
  num? collection;
  String? pickupDate;
  String? pickupTime;
  String? remarks;
  String? inside;
  String? district;
  String? deliveryNote;
  dynamic deliveryDate;
  String? type;
  String? securityCode;
  String? isPartial;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? colection;
  String? delivery;
  String? insurance;
  String? cod;
  String? merchantPay;
  String? collect;
  String? returnCharge;
  String? merchant;

  ConfirmOrderReportData(
      {this.id,
      this.userId,
      this.trackingId,
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
      this.createdAt,
      this.updatedAt,
      this.colection,
      this.delivery,
      this.insurance,
      this.cod,
      this.merchantPay,
      this.collect,
      this.returnCharge});

  ConfirmOrderReportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    trackingId = json['tracking_id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    colection = json['colection'];
    delivery = json['delivery'];
    insurance = json['insurance'];
    cod = json['cod'];
    merchantPay = json['merchant_pay'];
    collect = json['collect'];
    returnCharge = json['return_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tracking_id'] = trackingId;
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['colection'] = colection;
    data['delivery'] = delivery;
    data['insurance'] = insurance;
    data['cod'] = cod;
    data['merchant_pay'] = merchantPay;
    data['collect'] = collect;
    data['return_charge'] = returnCharge;
    return data;
  }
}
