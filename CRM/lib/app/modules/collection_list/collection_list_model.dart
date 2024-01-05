class CollectionListModel {
  List<Collection>? collection;

  CollectionListModel({this.collection});

  CollectionListModel.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collection {
  int? id;
  String? collectionNo;
  String? collectionDate;
  String? businessName;
  String? mobileNo;
  String? invoiceNo;
  String? dueAmount;
  String? collectionAmount;
  String? collectedAmount;
  String? invoiceAmount;
  String? collectionMode;
  String? currency;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Collection(
      {this.id,
        this.collectionNo,
        this.collectionDate,
        this.businessName,
        this.mobileNo,
        this.invoiceNo,
        this.dueAmount,
        this.collectionAmount,
        this.collectedAmount,
        this.invoiceAmount,
        this.collectionMode,
        this.currency,
        this.comment,
        this.createdAt,
        this.updatedAt});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionNo = json['collection_no'];
    collectionDate = json['collection_date'];
    businessName = json['business_name'];
    mobileNo = json['mobile_no'];
    invoiceNo = json['invoice_no'];
    dueAmount = json['due_amount'];
    collectionAmount = json['collection_amount'];
    collectedAmount = json['collected_amount'];
    invoiceAmount = json['invoice_amount'];
    collectionMode = json['collection_mode'];
    currency = json['currency'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collection_no'] = this.collectionNo;
    data['collection_date'] = this.collectionDate;
    data['business_name'] = this.businessName;
    data['mobile_no'] = this.mobileNo;
    data['invoice_no'] = this.invoiceNo;
    data['due_amount'] = this.dueAmount;
    data['collection_amount'] = this.collectionAmount;
    data['collected_amount'] = this.collectedAmount;
    data['invoice_amount'] = this.invoiceAmount;
    data['collection_mode'] = this.collectionMode;
    data['currency'] = this.currency;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
