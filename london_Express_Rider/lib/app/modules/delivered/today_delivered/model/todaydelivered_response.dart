class TodayDeliverdResponse {
  List<TodayDeliveredData>? data;
  bool? status;
  String? message;

  TodayDeliverdResponse({this.data, this.status, this.message});

  TodayDeliverdResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TodayDeliveredData>[];
      json['data'].forEach((v) {
        data!.add(TodayDeliveredData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
class TodayDeliveredData {
  String? trackingId;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? collect;

  TodayDeliveredData(
      {this.trackingId,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.collect});

  TodayDeliveredData.fromJson(Map<String, dynamic> json) {
    trackingId = json['tracking_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    collect = json['collect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_id'] = this.trackingId;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['collect'] = this.collect;
    return data;
  }
}


// class TransferResponse {
//   List<TransferData>? data;
//   bool? status;
//   String? message;
//
//   TransferResponse({this.data, this.status, this.message});
//
//   TransferResponse.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <TransferData>[];
//       json['data'].forEach((v) {
//         data!.add(TransferData.fromJson(v));
//       });
//     }
//     status = json['status'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class TransferData {
//   int? id;
//   String? invoiceId;
//   int? senderId;
//   int? receiverId;
//   int? mediaId;
//   String? type;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   Sender? sender;
//   Sender? receiver;
//
//   TransferData(
//       {this.id,
//         this.invoiceId,
//         this.senderId,
//         this.receiverId,
//         this.mediaId,
//         this.type,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.sender,
//         this.receiver});
//
//   TransferData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     invoiceId = json['invoice_id'];
//     senderId = json['sender_id'];
//     receiverId = json['receiver_id'];
//     mediaId = json['media_id'];
//     type = json['type'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     sender =
//     json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
//     receiver =
//     json['receiver'] != null ? new Sender.fromJson(json['receiver']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['invoice_id'] = this.invoiceId;
//     data['sender_id'] = this.senderId;
//     data['receiver_id'] = this.receiverId;
//     data['media_id'] = this.mediaId;
//     data['type'] = this.type;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.sender != null) {
//       data['sender'] = this.sender!.toJson();
//     }
//     if (this.receiver != null) {
//       data['receiver'] = this.receiver!.toJson();
//     }
//     return data;
//   }
// }
//
// class Sender {
//   int? id;
//   String? name;
//   String? email;
//   String? mobile;
//   String? address;
//   String? photo;
//   int? role;
//   Null? emailVerifiedAt;
//   Null? otpCode;
//   Null? otpCreatedTime;
//   int? isVerified;
//   String? createdAt;
//   String? updatedAt;
//
//   Sender(
//       {this.id,
//         this.name,
//         this.email,
//         this.mobile,
//         this.address,
//         this.photo,
//         this.role,
//         this.emailVerifiedAt,
//         this.otpCode,
//         this.otpCreatedTime,
//         this.isVerified,
//         this.createdAt,
//         this.updatedAt});
//
//   Sender.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     mobile = json['mobile'];
//     address = json['address'];
//     photo = json['photo'];
//     role = json['role'];
//     emailVerifiedAt = json['email_verified_at'];
//     otpCode = json['otp_code'];
//     otpCreatedTime = json['otp_created_time'];
//     isVerified = json['is_verified'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['address'] = this.address;
//     data['photo'] = this.photo;
//     data['role'] = this.role;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['otp_code'] = this.otpCode;
//     data['otp_created_time'] = this.otpCreatedTime;
//     data['is_verified'] = this.isVerified;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }