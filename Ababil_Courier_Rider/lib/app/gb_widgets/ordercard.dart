import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/gb_widgets/reportrow.dart';
import 'package:flutter/material.dart';

import '../const/app_constant.dart';
import '../modules/confirmorderreport/model/order_response.dart';
import 'customcardshape.dart';

class OrderCard extends StatelessWidget {
  final ConfirmOrderReportData? confirmOrderReportData;
  final VoidCallback press;
  final bool? isPres;
  const OrderCard(
      {Key? key,
      required this.confirmOrderReportData,
      required this.press,
      required this.isPres})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Text(' api thik nai.. api thik korle nicher code gula un comment korle details show korbe'),
        /*Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Tracking info*",
                                  style: CustomThemes().cardTextStyle(),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: InkWell(
                                  onTap: press,
                                  child: Container(
                                    //alignment: Alignment.center,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: isPres!
                                          ? AppColorsConst.dPrimaryColor
                                          : AppColorsConst.mBorderColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(confirmOrderReportData!.status.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: isPres!
                                                  ? Colors.white
                                                  : Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Status**",
                            style: CustomThemes().cardTextStyle(),
                          ),
                          ReportRow(
                              title: 'Track Id',
                              value: confirmOrderReportData!.trackingId.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          ReportRow(
                              title: 'Order id',
                              value:"${confirmOrderReportData!.orderId.toString() ?? 'not found'}"
                            *//*confirmOrderReportData!.orderId ?? 'not found'*//*),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Customer info*",
                            style: CustomThemes().cardTextStyle(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          ReportRow(
                              title: 'Shop Name',
                              value: "${confirmOrderReportData!.shop.toString() ?? 'not found'}"
                            *//*confirmOrderReportData!.shop ?? 'not found'*//*),
                          const SizedBox(
                            height: 4,
                          ),
                          ReportRow(
                              title: 'Name',
                              value: confirmOrderReportData!.customerName.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          ReportRow(
                              title: 'Phone',
                              value: confirmOrderReportData!.customerPhone.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          ReportRow(
                              title: 'Address',
                              value: confirmOrderReportData!.customerAddress.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          ReportRow(
                              title: 'Date',
                              value: confirmOrderReportData!.createdAt.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              // Expanded(
                              //   flex: 3,
                              //   child: CustomCardShape(
                              //     text: orderModel!.pickupTime.toString(),
                              //   ),
                              // ),
                              Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomCardShape(
                                        text: '${confirmOrderReportData!.weight.toString()} kg',
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomCardShape(
                                        text: '${confirmOrderReportData!.collection.toString()} ৳',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}
