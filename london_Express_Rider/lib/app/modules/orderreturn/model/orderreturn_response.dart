class ReturnOrderResponse {
  List<ReturnOrderData>? data;
  bool? status;
  String? message;

  ReturnOrderResponse({this.data, this.status, this.message});

  ReturnOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReturnOrderData>[];
      json['data'].forEach((v) {
        data!.add(ReturnOrderData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ReturnOrderData {
  int? id;
  String? invoiceId;
  String? merchantId;
  String? shop;
  dynamic riderId;
  String? status;
  dynamic securityCode;
  dynamic createBy;
  dynamic updateBy;
  String? createdAt;
  String? updatedAt;
  String? address;
  String? mobile;
  String? businessName;
  dynamic tCollect;

  ReturnOrderData(
      {this.id,
      this.invoiceId,
      this.merchantId,
      this.shop,
      this.riderId,
      this.status,
      this.securityCode,
      this.createBy,
      this.updateBy,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.mobile,
      this.businessName,
      this.tCollect});

  ReturnOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    merchantId = json['merchant_id'];
    shop = json['shop'];
    riderId = json['rider_id'];
    status = json['status'];
    securityCode = json['security_code'];
    createBy = json['create_by'];
    updateBy = json['update_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
    mobile = json['mobile'];
    businessName = json['business_name'];
    tCollect = json['t_collect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_id'] = invoiceId;
    data['merchant_id'] = merchantId;
    data['shop'] = shop;
    data['rider_id'] = riderId;
    data['status'] = status;
    data['security_code'] = securityCode;
    data['create_by'] = createBy;
    data['update_by'] = updateBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['address'] = address;
    data['mobile'] = mobile;
    data['business_name'] = businessName;
    data['t_collect'] = tCollect;
    return data;
  }
}
