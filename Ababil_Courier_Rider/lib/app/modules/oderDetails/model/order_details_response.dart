import 'package:amvines_rider_new/app/modules/confirmorderreport/model/order_response.dart';

class OrderDetailsResponse {
  bool? status;
  List<ConfirmOrderReportData>? orders;
  String? msg;

  OrderDetailsResponse({this.status, this.orders, this.msg});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['orders'] != null) {
      orders = <ConfirmOrderReportData>[];
      json['orders'].forEach((v) {
        orders!.add(ConfirmOrderReportData.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    return data;
  }
}
