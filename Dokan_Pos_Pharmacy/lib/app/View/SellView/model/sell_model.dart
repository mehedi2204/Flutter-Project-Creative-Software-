class SellModel {
  int? id;
  String? name;
  String? supplier;
  // String? code;
  // String? genericName;
  String? expiryDate;
  String? batchNo;
  // double? minimum;
  // double? quantity;
  // String? unit;
  // double? cost;
  var mrp;
  // Null? itemDiscount;
  var price;
  // double? shop;
  // String? createdAt;
  // String? updatedAt;

  SellModel(
      {this.id,
        this.name,
        this.supplier,
        // this.code,
        // this.genericName,
        this.expiryDate,
        this.batchNo,
        // this.minimum,
        // this.quantity,
        // this.unit,
        // this.cost,
        this.mrp,
        // this.itemDiscount,
        this.price,
        // this.shop,
        // this.createdAt,
        // this.updatedAt
      });

  SellModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supplier = json['supplier'];
    // code = json['code'];
    // genericName = json['generic_name'];
    expiryDate = json['expiry_date'];
    batchNo = json['batch_no'];
    // minimum = json['minimum'];
    // quantity = json['quantity'];
    // unit = json['unit'];
    // cost = json['cost'];
    mrp = json['mrp'];
    // itemDiscount = json['item_discount'];
    price = json['price'];
    // shop = json['shop'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['supplier'] = this.supplier;
    // data['code'] = this.code;
    // data['generic_name'] = this.genericName;
    data['expiry_date'] = this.expiryDate;
    data['batch_no'] = this.batchNo;
    // data['minimum'] = this.minimum;
    // data['quantity'] = this.quantity;
    // data['unit'] = this.unit;
    // data['cost'] = this.cost;
    data['mrp'] = this.mrp;
    // data['item_discount'] = this.itemDiscount;
    data['price'] = this.price;
    // data['shop'] = this.shop;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    return data;
  }
}
