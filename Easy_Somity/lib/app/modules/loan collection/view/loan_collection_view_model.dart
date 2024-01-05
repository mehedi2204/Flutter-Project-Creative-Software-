class LoanCollection {
  String? status;
  String? installmentCcollectionNo;
  Data? data;
  List<InstallmentCollection>? installmentCollection;
  int? totalCollection;

  LoanCollection(
      {this.status,
        this.installmentCcollectionNo,
        this.data,
        this.installmentCollection,
        this.totalCollection});

  LoanCollection.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    installmentCcollectionNo = json['installment_collection_no'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['InstallmentCollection'] != null) {
      installmentCollection = <InstallmentCollection>[];
      json['InstallmentCollection'].forEach((v) {
        installmentCollection!.add(new InstallmentCollection.fromJson(v));
      });
    }
    totalCollection = json['TotalCollection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['installment_collection_no'] = this.installmentCcollectionNo;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.installmentCollection != null) {
      data['InstallmentCollection'] =
          this.installmentCollection!.map((v) => v.toJson()).toList();
    }
    data['TotalCollection'] = this.totalCollection;
    return data;
  }
}

class Data {
  String? areaId;
  int? id;
  String? memberNo;
  String? memberName;
  String? membersFatherName;
  String? mobileNo;
  String? installmentAmount;
  String? loanNo;
  String? totalAmount;
  Areas? areas;
  Photos? photos;

  Data(
      {this.areaId,
        this.id,
        this.memberNo,
        this.memberName,
        this.membersFatherName,
        this.mobileNo,
        this.installmentAmount,
        this.loanNo,
        this.totalAmount,
        this.areas,
        this.photos});

  Data.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'];
    id = json['id'];
    memberNo = json['member_no'];
    memberName = json['member_name'];
    membersFatherName = json['members_father_name'];
    mobileNo = json['mobile_no'];
    installmentAmount = json['installment_amount'];
    loanNo = json['loan_no'];
    totalAmount = json['total_amount'];
    areas = json['areas'] != null ? new Areas.fromJson(json['areas']) : null;
    photos =
    json['photos'] != null ? new Photos.fromJson(json['photos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_id'] = this.areaId;
    data['id'] = this.id;
    data['member_no'] = this.memberNo;
    data['member_name'] = this.memberName;
    data['members_father_name'] = this.membersFatherName;
    data['mobile_no'] = this.mobileNo;
    data['installment_amount'] = this.installmentAmount;
    data['loan_no'] = this.loanNo;
    data['total_amount'] = this.totalAmount;
    if (this.areas != null) {
      data['areas'] = this.areas!.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos!.toJson();
    }
    return data;
  }
}

class Areas {
  int? id;
  int? branchId;
  String? areaName;
  String? district;
  String? status;
  String? createdAt;
  String? updatedAt;

  Areas(
      {this.id,
        this.branchId,
        this.areaName,
        this.district,
        this.status,
        this.createdAt,
        this.updatedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    areaName = json['area_name'];
    district = json['district'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['area_name'] = this.areaName;
    data['district'] = this.district;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Photos {
  int? id;
  int? memberId;
  String? memberProfilePhoto;
  String? memberSignature;
  String? memberNid;
  Null? nominee1Nid;
  Null? nominee2Nid;
  Null? fileAttachment1;
  Null? fileAttachment2;
  Null? status;
  String? createdAt;
  String? updatedAt;

  Photos(
      {this.id,
        this.memberId,
        this.memberProfilePhoto,
        this.memberSignature,
        this.memberNid,
        this.nominee1Nid,
        this.nominee2Nid,
        this.fileAttachment1,
        this.fileAttachment2,
        this.status,
        this.createdAt,
        this.updatedAt});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    memberProfilePhoto = json['member_profile_photo'];
    memberSignature = json['member_signature'];
    memberNid = json['member_nid'];
    nominee1Nid = json['nominee1_nid'];
    nominee2Nid = json['nominee2_nid'];
    fileAttachment1 = json['file_attachment1'];
    fileAttachment2 = json['file_attachment2'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['member_profile_photo'] = this.memberProfilePhoto;
    data['member_signature'] = this.memberSignature;
    data['member_nid'] = this.memberNid;
    data['nominee1_nid'] = this.nominee1Nid;
    data['nominee2_nid'] = this.nominee2Nid;
    data['file_attachment1'] = this.fileAttachment1;
    data['file_attachment2'] = this.fileAttachment2;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class InstallmentCollection {
  int? id;
  String? memberNo;
  String? loanNo;
  String? installmentCollection;
  String? previousDue;
  String? fine;
  String? note;
  int? collectedBy;
  String? createdAt;
  String? updatedAt;

  InstallmentCollection(
      {this.id,
        this.memberNo,
        this.loanNo,
        this.installmentCollection,
        this.previousDue,
        this.fine,
        this.note,
        this.collectedBy,
        this.createdAt,
        this.updatedAt});

  InstallmentCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberNo = json['member_no'];
    loanNo = json['loan_no'];
    installmentCollection = json['installment_collection'];
    previousDue = json['previous_due'];
    fine = json['fine'];
    note = json['note'];
    collectedBy = json['collected_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_no'] = this.memberNo;
    data['loan_no'] = this.loanNo;
    data['installment_collection'] = this.installmentCollection;
    data['previous_due'] = this.previousDue;
    data['fine'] = this.fine;
    data['note'] = this.note;
    data['collected_by'] = this.collectedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

