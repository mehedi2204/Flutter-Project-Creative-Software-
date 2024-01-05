import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/controllers/order_details_controller.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/providers/orderreturn_provider.dart';
import 'package:amvines_rider_new/app/modules/transferreq/model/transfer_response.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/app_constant.dart';

class TransferOrderCard extends StatelessWidget {
  final TransferData? transferData;
  final VoidCallback press;
  final bool? isPres;
  const TransferOrderCard(
      {Key? key,
      required this.transferData,
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
        child: Column(
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
                                child: Text(
                                  'Time',
                                  style: CustomThemes()
                                      .headingStyle(15)
                                      .copyWith(color: AppColorsConst.darkGrey),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  transferData!.createdAt.toString(),
                                  style: CustomThemes()
                                      .headingStyle(15)
                                      .copyWith(color: AppColorsConst.darkGrey,
                                  fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Invoice',
                                  style: CustomThemes()
                                      .headingStyle(20)
                                      .copyWith(color: AppColorsConst.orrange),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  transferData!.invoiceId.toString(),
                                  style: CustomThemes()
                                      .headingStyle(20)
                                      .copyWith(color: AppColorsConst.orrange),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Pickup Address',
                                  style: CustomThemes()
                                      .headingStyle(18)
                                      .copyWith(
                                        color: AppColorsConst.dTextColor,
                                        //decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  transferData!.sender!.address.toString(),
                                  style: CustomThemes()
                                      .headingStyle(15)
                                      .copyWith(color: AppColorsConst.darkGrey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         transferData!.sender!.name.toString(),
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         transferData!.receiver!.name.toString(),
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Delivery Address',
                                  style: CustomThemes()
                                      .headingStyle(18)
                                      .copyWith(
                                    color: AppColorsConst.dTextColor,
                                    //decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: Text(
                              //     transferData!.sender!.address.toString(),
                              //     style: CustomThemes()
                              //         .headingStyle(15)
                              //         .copyWith(color: AppColorsConst.darkGrey),
                              //   ),
                              // ),

                              Expanded(
                                child: Text(
                                  transferData!.receiver!.address.toString(),
                                  style: CustomThemes()
                                      .headingStyle(15)
                                      .copyWith(color: AppColorsConst.darkGrey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         'Phone',
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         transferData!.receiver!.mobile.toString(),
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         'Rider Id',
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         transferData!.mediaId.toString(),
                          //         style: CustomThemes()
                          //             .headingStyle(15)
                          //             .copyWith(color: AppColorsConst.darkGrey),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Status Type',
                                    style: CustomThemes()
                                        .headingStyle(15)
                                        .copyWith(color: AppColorsConst.darkGrey),),
                              ),
                              Expanded(
                                child: Text(transferData!.type.toString(),
                                    style: CustomThemes()
                                        .headingStyle(15)
                                        .copyWith(color: AppColorsConst.darkGrey),),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColorsConst.dPrimaryColor
                                        .withOpacity(0.1),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: press,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.check,
                                            color: AppColorsConst.dPrimaryColor,
                                          ),
                                        ),
                                        Text('Reach To',
                                            textAlign: TextAlign.end,
                                            style: CustomThemes()
                                                .headingStyle(15)
                                                .copyWith(
                                                    color: AppColorsConst
                                                        .dPrimaryColor)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color:
                              //           const Color.fromRGBO(151, 151, 151, 1)
                              //               .withOpacity(0.12),
                              //       borderRadius: const BorderRadius.only(
                              //         bottomRight: Radius.circular(10),
                              //         topRight: Radius.circular(10),
                              //       ),
                              //     ),
                              //     height: 50,
                              //     child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           Text(transferData!.createdAt.toString(),
                              //               textAlign: TextAlign.end,
                              //               style: CustomThemes()
                              //                   .headingStyle(14)
                              //                   .copyWith(
                              //                       color: AppColorsConst
                              //                           .dPrimaryColor)),
                              //         ],
                              //       ),
                              //     ),
                              //   ),



                              // Expanded(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color:
                              //           const Color.fromRGBO(151, 151, 151, 1)
                              //               .withOpacity(0.12),
                              //       borderRadius: const BorderRadius.only(
                              //         bottomRight: Radius.circular(10),
                              //         topRight: Radius.circular(10),
                              //       ),
                              //     ),
                              //     height: 50,
                              //     child: InkWell(
                              //       onTap: () {
                              //         Get.toNamed(Routes.ORDERDETAILS);
                              //         Get.put(OrderDetailsController(
                              //                 provider: OrderDetailsProvider()))
                              //             .getTransferOrderList(
                              //                 invoiceId: transferData!.invoiceId
                              //                     .toString());
                              //         // Get.find<OrderDetailsController>()
                              //         //     .getReturnOdrderList(
                              //         //         invoiceId: returnOrderData!
                              //         //             .invoiceId
                              //         //             .toString());
                              //       },
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           Text('View All',
                              //               textAlign: TextAlign.end,
                              //               style: CustomThemes()
                              //                   .headingStyle(16)
                              //                   .copyWith(
                              //                       color: AppColorsConst
                              //                           .dPrimaryColor)),
                              //           const Padding(
                              //             padding: EdgeInsets.only(left: 8.0),
                              //             child: Icon(
                              //               Icons.read_more,
                              //               color: AppColorsConst.dPrimaryColor,
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
        ),
      ),
    );
  }
}
