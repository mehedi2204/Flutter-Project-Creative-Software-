import 'package:amvines_rider_new/app/gb_widgets/list_mobile.dart';
import 'package:amvines_rider_new/app/gb_widgets/list_row.dart';
import 'package:flutter/material.dart';

import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/modules/pickupreq/model/pickupreq.dart';

import '../const/custom_themes.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ListCard extends StatelessWidget {
  final PickupRequest pickupRequest;
  final VoidCallback cancel, accept;

  const ListCard(
      {Key? key,
      required this.pickupRequest,
      required this.accept,
      required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
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
                      child: Text(pickupRequest.trackingId.toString(),
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
                children: const [
                  Expanded(
                      child: Text(
                    "Merchant info*",
                    style: TextStyle(
                        fontSize: 12, color: AppColorsConst.mBackgroundColor2),
                  )),
                ],
              ),
              ListRow(
                title: 'Name',
                value: pickupRequest.merchant.toString(),
              ),
              ListMobile(
                title: 'Mobile',
                value: pickupRequest.mobile.toString(),
                press: () {
                  UrlLauncher.launchUrl(
                      Uri.parse('tel://${pickupRequest.mobile.toString()}'));
                },
              ),
              ListRow(
                title: 'Address',
                value: pickupRequest.address.toString(),
              ),
              ListRow(
                title: 'Type',
                value: pickupRequest.product.toString(),
              ),
              if (pickupRequest.pickupTime != null)
                ListRow(
                  title: 'Time',
                  value: pickupRequest.pickupTime.toString(),
                ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Text(
                    "Customer info*",
                    style: TextStyle(
                        fontSize: 12, color: AppColorsConst.mBackgroundColor2),
                  )),
                ],
              ),
              ListRow(
                title: 'User ID',
                value: pickupRequest.userId.toString(),
              ),
              ListRow(
                title: 'Name',
                value: pickupRequest.customerName.toString(),
              ),
              ListMobile(
                title: 'Mobile',
                value: pickupRequest.customerPhone.toString(),
                press: () {
                  UrlLauncher.launchUrl(
                      Uri.parse('tel://${pickupRequest.customerPhone.toString()}'));
                },
              ),
              ListRow(
                title: 'Address',
                value: pickupRequest.customerAddress.toString(),
              ),
              const SizedBox(
                height: 15,
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
                        padding: const EdgeInsets.only(right: 10.0, left: 4),
                        child: InkWell(
                          onTap: cancel,
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
                                  "Cancel",
                                  style: CustomThemes().titleTextStyle.copyWith(
                                      color: const Color.fromARGB(
                                          255, 131, 37, 30)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.clear,
                                  color: Color.fromARGB(255, 159, 48, 41),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: accept,
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
                                  "Accept",
                                  style: CustomThemes().titleTextStyle.copyWith(
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
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
