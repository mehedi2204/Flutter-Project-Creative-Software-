// import 'package:amvines_rider_new/app/modules/confirmorderreport/model/order_response.dart';
//
// class OrderReport {
//   List<OrderModel>? order;
//   num? qty;
//   num? total;
//
//   OrderReport({this.order, this.qty, this.total});
//
//   OrderReport.fromJson(Map<String, dynamic> json) {
//     if (json['order'] != null) {
//       order = <OrderModel>[];
//       json['order'].forEach((v) {
//         order!.add(OrderModel.fromJson(v));
//       });
//     }
//     qty = json['Qty'];
//     total = json['Total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (order != null) {
//       data['order'] = order!.map((v) => v.toJson()).toList();
//     }
//     data['Qty'] = qty;
//     data['Total'] = total;
//     return data;
//   }
// }
