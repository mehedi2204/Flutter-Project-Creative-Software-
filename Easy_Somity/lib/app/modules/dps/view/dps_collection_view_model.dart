class DpsCollectionView {
  String? status;
  String? dps_collection_no;
  Data? data;
  List<DpsCollection>? dpsCollection;
  int? totalReceive;

  DpsCollectionView(
      {this.status, this.dps_collection_no, this.data, this.dpsCollection, this.totalReceive});

  DpsCollectionView.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dps_collection_no = json['Dps_collection_no'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['DpsCollection'] != null) {
      dpsCollection = <DpsCollection>[];
      json['DpsCollection'].forEach((v) {
        dpsCollection!.add(new DpsCollection.fromJson(v));
      });
    }
    totalReceive = json['TotalReceive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Dps_collection_no'] = this.dps_collection_no;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.dpsCollection != null) {
      data['DpsCollection'] =
          this.dpsCollection!.map((v) => v.toJson()).toList();
    }
    data['TotalReceive'] = this.totalReceive;
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
  String? monthlySavingNo;
  int? amountPerInstallment;
  Areas? areas;
  Photos? photos;

  Data(
      {this.areaId,
        this.id,
        this.memberNo,
        this.memberName,
        this.membersFatherName,
        this.mobileNo,
        this.monthlySavingNo,
        this.amountPerInstallment,
        this.areas,
        this.photos});

  Data.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'];
    id = json['id'];
    memberNo = json['member_no'];
    memberName = json['member_name'];
    membersFatherName = json['members_father_name'];
    mobileNo = json['mobile_no'];
    monthlySavingNo = json['monthly_saving_no'];
    amountPerInstallment = json['amount_per_installment'];
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
    data['monthly_saving_no'] = this.monthlySavingNo;
    data['amount_per_installment'] = this.amountPerInstallment;
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

class DpsCollection {
  int? id;
  String? memberNo;
  String? monthlySavingNo;
  String? installmentCollection;
  String? installmentOverdue;
  String? fine;
  String? note;
  int? collectedBy;
  String? createdAt;
  String? updatedAt;

  DpsCollection(
      {this.id,
        this.memberNo,
        this.monthlySavingNo,
        this.installmentCollection,
        this.installmentOverdue,
        this.fine,
        this.note,
        this.collectedBy,
        this.createdAt,
        this.updatedAt});

  DpsCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberNo = json['member_no'];
    monthlySavingNo = json['monthly_saving_no'];
    installmentCollection = json['installment_collection'];
    installmentOverdue = json['installment_overdue'];
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
    data['monthly_saving_no'] = this.monthlySavingNo;
    data['installment_collection'] = this.installmentCollection;
    data['installment_overdue'] = this.installmentOverdue;
    data['fine'] = this.fine;
    data['note'] = this.note;
    data['collected_by'] = this.collectedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
