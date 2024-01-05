import 'package:amvines_rider_new/app/gb_widgets/list_mobile.dart';
import 'package:flutter/material.dart';
import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/gb_widgets/list_row.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/model/delivery_request.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../gb_widgets/custom_progress_dialog.dart';

class DeliveryReqCard extends StatelessWidget {
  final DeliveryRequest deliveryRequest;
  final VoidCallback option, exchange, delivered;
  const DeliveryReqCard({
    Key? key,
    required this.deliveryRequest,
    required this.option,
    required this.exchange,
    required this.delivered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColorsConst.mBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //height: 30,
                decoration: const BoxDecoration(
                  color: AppColorsConst.mBandColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Tracking Id :",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(deliveryRequest.trackingId.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                        "Merchant info*",
                        style: CustomThemes()
                            .titleTextStyle
                            .copyWith(color: AppColorsConst.mBackgroundColor2),
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ListRow(
                title: 'Merchant',
                value: deliveryRequest.businessName!.toUpperCase().toString(),
              ),
              const SizedBox(height: 5,),
              ListMobile(
                title: 'Phone',
                value: deliveryRequest.mobile.toString(),
                press: () {
                  UrlLauncher.launchUrl(Uri.parse(
                      'tel:${deliveryRequest.mobile.toString()}'));
                },
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "Customer info*",
                    style: CustomThemes()
                        .titleTextStyle
                        .copyWith(color: AppColorsConst.mBackgroundColor2),
                  )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ListRow(
                title: 'Name',
                value: deliveryRequest.customerName.toString(),
              ),
              const SizedBox(
                height: 5,
              ),

              ListMobile(
                title: 'Phone',
                value: deliveryRequest.customerPhone.toString(),
                press: () {
                  UrlLauncher.launchUrl(Uri.parse(
                      'tel:${deliveryRequest.customerPhone.toString()}'));
                },
              ),
              //url_launcher: ^6.1.5
              const SizedBox(
                height: 5,
              ),
              ListRow(
                title: 'Collection',
                value: deliveryRequest.collection.toString(),
              ),
              const SizedBox(
                height: 5,
              ),
              ListRow(
                title: 'Address',
                value: deliveryRequest.customerAddress.toString(),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                //height: 30,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: (){
                            showAlertDialog(context);
                          },
                          // onTap: () {
                          //   buildCustomDialog(
                          //       context, index, () {
                          //     Navigator.pop(context);
                          //     requestConfirm(
                          //         pickupdeliveredlist[index]
                          //                 ['tracking_id']
                          //             .toString());
                          //   }, 'Confirm');
                          // },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 53, 126, 91))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Delivered",
                                  style: CustomThemes().titleTextStyle.copyWith(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                          255, 53, 126, 91)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_downward,
                                  color: Color.fromARGB(255, 41, 88, 65),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (deliveryRequest.isPartial == 1)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 4),
                          child: InkWell(
                            onTap: exchange,
                            // onTap: () {
                            //   buildCustomDialog(
                            //       context, index, () {
                            //     Navigator.pop(context);
                            //     requestConfirm(
                            //         pickupdeliveredlist[index]
                            //                 ['tracking_id']
                            //             .toString());
                            //   }, 'Hold');
                            // },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.purple)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Exchange",
                                    style: CustomThemes()
                                        .titleTextStyle
                                        .copyWith(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 59, 11, 68)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_upward,
                                    color: Color.fromARGB(255, 59, 11, 68),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 4),
                        child: InkWell(
                          onTap: option,
                          // onTap: () {
                          //   buildCustomDialog(
                          //       context, index, () {
                          //     Navigator.pop(context);
                          //     requestCeancle(
                          //         pickupdeliveredlist[index]
                          //                 ['tracking_id']
                          //             .toString());
                          //   }, 'Cancel');

                          // },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 113, 36, 30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Option",
                                  style: CustomThemes().titleTextStyle.copyWith(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                          255, 131, 37, 30)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.menu,
                                  color: Color.fromARGB(255, 159, 48, 41),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          )),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "NO",
        style: TextStyle(color: AppColorsConst.darkGrey, fontSize: 15),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "YES",
        style: TextStyle(color: AppColorsConst.dPrimaryColor, fontSize: 15),
      ),
      onPressed: () {
        showLoaderDialog(Get.context);
        delivered();
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //backgroundColor: Colors.red,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        "Are you sure",
        style: TextStyle(
          color: AppColorsConst.dPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "You want to delivery?",
        style: TextStyle(
          color: AppColorsConst.darkGrey,
        ),
      ),
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
