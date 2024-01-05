import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:amvines_rider_new/app/gb_widgets/button_widgets.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navmenu_controller.dart';

class NavmenuView extends GetView<NavmenuController> {
  const NavmenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColorsConst.dPrimaryColor,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
              child: Container(
                color: AppColorsConst.dPrimaryColor,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.all(8.0),
                    child: const Image(
                      image: AssetImage("assets/png/logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      color: AppColorsConst.dPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 18,
                        child: ClipOval(
                          //StorageHelper.readString(key: 'token')
                          child:
                              //  StorageHelper.readString(key: "photo") != null
                              //     ? Image.network(
                              //         "${BaseUrl.basedUrl}/public/photo/${StorageHelper.readString(key: "photo")}")
                              //     :
                              Image.asset("assets/png/man.png"),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 16),
                            child: Text(
                              StorageHelper.readString(key: "name") ?? '',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              StorageHelper.readString(key: "mobile") ?? '----',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 3,
              color: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 28,
                color: Colors.white,
              ),
              title: GestureDetector(
                child: Text(
                  "Dashboard".tr.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onTap: () {
                Get.offAllNamed(Routes.HOME);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.clear_all_rounded,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Pick Up Requests".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(Routes.PICKUPREQ);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.assignment,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Auto Pick Up".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(Routes.PICKUPASSIGN);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.delivery_dining,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Delivery Requests".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(Routes.DELIVERYREQ);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.assignment_return_outlined,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Order Return".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(Routes.ORDERRETURN);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.transfer_within_a_station_sharp,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Transfer Requests".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(Routes.TRANSFER);
              },
            ),




            // Theme(
            //   data: Theme.of(context).copyWith(
            //       colorScheme: ColorScheme.fromSwatch()
            //           .copyWith(secondary: Colors.white)),
            //   child: ExpansionTile(
            //     leading: const Icon(
            //       Icons.report,
            //       size: 28,
            //       color: Colors.white,
            //     ),
            //     title: Text(
            //       "Report".tr.toString(),
            //       style: const TextStyle(fontSize: 16, color: Colors.white),
            //     ),
            //     children: [
            //       const Divider(),
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed(Routes.CONFIRMORDERREPORT);
            //         },
            //         child: Container(
            //           alignment: Alignment.centerLeft,
            //           padding:
            //               const EdgeInsets.only(left: 72, top: 8, bottom: 8),
            //           child: Text(
            //             "Confirm Order Report".tr.toString(),
            //             style:
            //                 const TextStyle(fontSize: 16, color: Colors.white),
            //           ),
            //         ),
            //       ),
            //       const Divider(),
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed(Routes.TRANSFERORDERREPORT);
            //         },
            //         child: Container(
            //           alignment: Alignment.centerLeft,
            //           padding:
            //               const EdgeInsets.only(left: 72, top: 8, bottom: 16),
            //           child: Text(
            //             "Tranfer Report".tr.toString(),
            //             style:
            //                 const TextStyle(fontSize: 16, color: Colors.white),
            //           ),
            //         ),
            //       ),
            //       const Divider(),
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed(Routes.RETURNORDERREPORT);
            //         },
            //         child: Container(
            //           alignment: Alignment.centerLeft,
            //           padding:
            //               const EdgeInsets.only(left: 72, top: 8, bottom: 16),
            //           child: Text(
            //             "Return  Report".tr.toString(),
            //             style:
            //                 const TextStyle(fontSize: 16, color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.language,
                  size: 28,
                  color: Colors.white,
                ),
                title: Text(
                  "Language Settings".tr.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                onTap: () {
                  _showBottomSheet(context);
                }),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.lock,
                  size: 28,
                  color: Colors.white,
                ),
                title: Text(
                  "Change password".tr.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(Routes.CHANGEPASSWORD);
                }),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 28,
                color: Colors.white,
              ),
              title: Text(
                "Log out".tr.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                // prefs!.setString('role', '0');
                StorageHelper.eraseAll();
                Get.offAllNamed(Routes.LOGIN);
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     HOME_PAGE, (Route<dynamic> route) => false);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(
    BuildContext context,
  ) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.height * .75,
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            const Spacer(),
            ButtonWidgets(
              width: 300,
              label: 'ENGLISH'.tr,
              press: () {
                Get.back();
                StorageHelper.remove(
                  key: 'lan',
                );
                Get.updateLocale(const Locale('en', 'US'));
              },
              clr: Colors.deepOrange,
              isClose: false,
            ),
            const SizedBox(height: 20.0),
            ButtonWidgets(
              width: 300,
              label: 'BANGLA'.tr,
              press: () {
                Get.back();
                Get.updateLocale(const Locale('bn', 'BD'));
                StorageHelper.setString(key: 'lan', value: 'bn');
              },
              clr: AppColorsConst.dPrimaryColor,
              isClose: false,
            ),
            const SizedBox(height: 40.0),
            ButtonWidgets(
              width: 250,
                label: 'Close'.tr,
                press: () {
                  Get.back();
                },
                clr: Colors.red[300]!,
                isClose: true),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    ));
  }
}
