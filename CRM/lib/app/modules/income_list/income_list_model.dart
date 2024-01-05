class IncomeListModel {
  List<IncomeVoucher>? incomeVoucher;

  IncomeListModel({this.incomeVoucher});

  IncomeListModel.fromJson(Map<String, dynamic> json) {
    if (json['income_voucher'] != null) {
      incomeVoucher = <IncomeVoucher>[];
      json['income_voucher'].forEach((v) {
        incomeVoucher!.add(new IncomeVoucher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.incomeVoucher != null) {
      data['income_voucher'] =
          this.incomeVoucher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncomeVoucher {
  int? id;
  String? issueDate;
  String? incomeVoucherNo;
  String? voucherType;
  String? description;
  String? amount;
  String? paymentType;
  String? note;
  String? createdAt;
  String? updatedAt;
  VoucherCategory? voucherCategory;
  String? banks;

  IncomeVoucher(
      {this.id,
        this.issueDate,
        this.incomeVoucherNo,
        this.voucherType,
        this.description,
        this.amount,
        this.paymentType,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.voucherCategory,
        this.banks});

  IncomeVoucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    issueDate = json['issue_date'];
    incomeVoucherNo = json['income_voucher_no'];
    voucherType = json['voucher_type'];
    description = json['description'];
    amount = json['amount'];
    paymentType = json['payment_type'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    voucherCategory = json['voucher_category'] != null
        ? new VoucherCategory.fromJson(json['voucher_category'])
        : null;
    banks = json['banks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['issue_date'] = this.issueDate;
    data['income_voucher_no'] = this.incomeVoucherNo;
    data['voucher_type'] = this.voucherType;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['payment_type'] = this.paymentType;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.voucherCategory != null) {
      data['voucher_category'] = this.voucherCategory!.toJson();
    }
    data['banks'] = this.banks;
    return data;
  }
}

class VoucherCategory {
  int? id;
  String? accountType;
  String? accountDescription;
  String? accountNo;
  String? createdAt;
  String? updatedAt;

  VoucherCategory(
      {this.id,
        this.accountType,
        this.accountDescription,
        this.accountNo,
        this.createdAt,
        this.updatedAt});

  VoucherCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountType = json['Account_type'];
    accountDescription = json['Account_description'];
    accountNo = json['Account_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Account_type'] = this.accountType;
    data['Account_description'] = this.accountDescription;
    data['Account_no'] = this.accountNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
