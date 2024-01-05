class ExpenseListModel {
  List<ExpenseVoucher>? expenseVoucher;

  ExpenseListModel({this.expenseVoucher});

  ExpenseListModel.fromJson(Map<String, dynamic> json) {
    if (json['expense_voucher'] != null) {
      expenseVoucher = <ExpenseVoucher>[];
      json['expense_voucher'].forEach((v) {
        expenseVoucher!.add(new ExpenseVoucher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expenseVoucher != null) {
      data['expense_voucher'] =
          this.expenseVoucher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseVoucher {
  int? id;
  String? issueDate;
  String? expenseVoucherNo;
  String? voucherType;
  String? description;
  String? amount;
  String? paymentType;
  String? note;
  String? createdAt;
  String? updatedAt;
  VoucherCategory? voucherCategory;
  String? banks;

  ExpenseVoucher(
      {this.id,
        this.issueDate,
        this.expenseVoucherNo,
        this.voucherType,
        this.description,
        this.amount,
        this.paymentType,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.voucherCategory,
        this.banks});

  ExpenseVoucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    issueDate = json['issue_date'];
    expenseVoucherNo = json['expense_voucher_no'];
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
    data['expense_voucher_no'] = this.expenseVoucherNo;
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
