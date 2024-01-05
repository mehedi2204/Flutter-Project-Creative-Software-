import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lbdl_merchant/presentation/controller/dashboard_controller.dart';
import 'package:lbdl_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/color_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/size_config.dart';
import 'package:lbdl_merchant/presentation/screens/resources/style_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/values_manager.dart';

class NavigationBarDrawer extends StatelessWidget {
  const NavigationBarDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Scaffold(
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colormanager.white,
              ),
              child: Image.asset(
                ImageAssets.splashLogo,
                height: 100,
              ),
            ),
            // ExpandableNotifier(
            //     child: Column(
            //   children: <Widget>[
            //     ScrollOnExpand(
            //       scrollOnExpand: true,
            //       scrollOnCollapse: false,
            //       child: ExpandablePanel(
            //         theme: const ExpandableThemeData(
            //           headerAlignment: ExpandablePanelHeaderAlignment.center,
            //           tapBodyToCollapse: true,
            //         ),
            //         header: Padding(
            //           padding: const EdgeInsets.only(left: AppPadding.p14),
            //           child: Text(
            //             'Settings',
            //             style: getBoldStyle(
            //                 color: Colormanager.darkGrey,
            //                 fontSize: FontSize.s16),
            //           ),
            //         ),
            //         collapsed: const SizedBox(),
            //         expanded: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             ListTile(
            //               leading: Icon(
            //                 Icons.shop,
            //                 color: Colormanager.darkGrey,
            //               ),
            //               selectedColor: Colormanager.primaryOpacity70,
            //               contentPadding:
            //                   const EdgeInsets.only(left: AppPadding.p14),
            //               title: Text(
            //                 'Shop',
            //                 style: getSemiBoldStyle(
            //                     color: Colormanager.black,
            //                     fontSize: FontSize.s14),
            //               ),
            //               onTap: () {
            //                 Get.back();
            //                 Get.toNamed(Routes.shop);
            //               },
            //             ),
            //             ListTile(
            //               leading: const Icon(Icons.person_add),
            //               selectedColor: Colormanager.primaryOpacity70,
            //               contentPadding:
            //                   const EdgeInsets.only(left: AppPadding.p14),
            //               iconColor: Colormanager.darkGrey,
            //               title: Text(
            //                 'Executive',
            //                 style: getSemiBoldStyle(
            //                     color: Colormanager.black,
            //                     fontSize: FontSize.s14),
            //               ),
            //               onTap: () {
            //                 // Update the state of the app.
            //                 // ...
            //                 Get.toNamed(Routes.executive);
            //               },
            //             ),
            //           ],
            //         ),
            //         builder: (_, collapsed, expanded) {
            //           return Expandable(
            //             collapsed: collapsed,
            //             expanded: expanded,
            //             theme: const ExpandableThemeData(crossFadePoint: 0),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // )),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colormanager.darkGrey,
              ),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding:
              const EdgeInsets.only(left: AppPadding.p14),
              title: Text(
                'Create Order',
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: FontSize.s16),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.createOrder);
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding:
              const EdgeInsets.only(left: AppPadding.p14),
              iconColor: Colormanager.darkGrey,
              title: Text(
                'Confirm Orders',
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: FontSize.s16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.toNamed(Routes.order);
              },
            ),
            const Divider(),
            /*ExpandableNotifier(
                child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p14),
                      child: Text(
                        'Order',
                        style: getBoldStyle(
                            color: Colormanager.darkGrey,
                            fontSize: FontSize.s16),
                      ),
                    ),
                    collapsed: const SizedBox(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.add,
                            color: Colormanager.darkGrey,
                          ),
                          selectedColor: Colormanager.primaryOpacity70,
                          contentPadding:
                              const EdgeInsets.only(left: AppPadding.p14),
                          title: Text(
                            'Create',
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          onTap: () {
                            Get.back();
                            Get.toNamed(Routes.createOrder);
                          },
                        ),
                        // ListTile(
                        //   leading: const Icon(Icons.drafts),
                        //   selectedColor: Colormanager.primaryOpacity70,
                        //   contentPadding:
                        //       const EdgeInsets.only(left: AppPadding.p14),
                        //   iconColor: Colormanager.darkGrey,
                        //   title: Text(
                        //     'Draft',
                        //     style: getSemiBoldStyle(
                        //         color: Colormanager.black,
                        //         fontSize: FontSize.s14),
                        //   ),
                        //   onTap: () {
                        //     // Update the state of the app.
                        //     // ...
                        //   },
                        // ),
                        ListTile(
                          leading: const Icon(Icons.list),
                          selectedColor: Colormanager.primaryOpacity70,
                          contentPadding:
                              const EdgeInsets.only(left: AppPadding.p14),
                          iconColor: Colormanager.darkGrey,
                          title: Text(
                            'Confirm Orders',
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                            Get.toNamed(Routes.order);
                          },
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ],
            )),*/

            ListTile(
              leading: Icon(
                Icons.history,
                color: Colormanager.darkGrey,
              ),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding:
              const EdgeInsets.only(left: AppPadding.p14),
              title: Text(
                'Order History',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: FontSize.s16),
              ),
              onTap: () {
                Get.toNamed(Routes.historyOrder);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.report_rounded),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding:
              const EdgeInsets.only(left: AppPadding.p14),
              iconColor: Colormanager.darkGrey,
              title: Text(
                'Return History',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: FontSize.s16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.toNamed(Routes.historyReturn);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payments),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding:
              const EdgeInsets.only(left: AppPadding.p14),
              iconColor: Colormanager.darkGrey,
              title: Text(
                'Payment History',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: FontSize.s16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.toNamed(Routes.historyPayment);
              },
            ),
            //const Divider(),
            // ExpandableNotifier(
            //     child: Column(
            //   children: <Widget>[
            //     ScrollOnExpand(
            //       scrollOnExpand: true,
            //       scrollOnCollapse: false,
            //       child: ExpandablePanel(
            //         theme: const ExpandableThemeData(
            //           headerAlignment: ExpandablePanelHeaderAlignment.center,
            //           tapBodyToCollapse: true,
            //         ),
            //         header: Padding(
            //           padding: const EdgeInsets.only(left: AppPadding.p14),
            //           child: Text(
            //             'Payment',
            //             style: getBoldStyle(
            //                 color: Colormanager.darkGrey, fontSize: FontSize.s16),
            //           ),
            //         ),
            //         collapsed: const SizedBox(),
            //         expanded: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             ListTile(
            //               leading: Icon(
            //                 Icons.payment,
            //                 color: Colormanager.darkGrey,
            //               ),
            //               selectedColor: Colormanager.primaryOpacity70,
            //               contentPadding:
            //                   const EdgeInsets.only(left: AppPadding.p14),
            //               title: Text(
            //                 'Confirmation',
            //                 style: getSemiBoldStyle(
            //                     color: Colormanager.black,
            //                     fontSize: FontSize.s14),
            //               ),
            //               onTap: () {
            //                 Get.back();
            //               },
            //             ),
            //           ],
            //         ),
            //         builder: (_, collapsed, expanded) {
            //           return Expandable(
            //             collapsed: collapsed,
            //             expanded: expanded,
            //             theme: const ExpandableThemeData(crossFadePoint: 0),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // )),
            // const Divider(),
            /*ExpandableNotifier(
                child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p14),
                      child: Text(
                        'Report',
                        style: getBoldStyle(
                            color: Colormanager.darkGrey,
                            fontSize: FontSize.s16),
                      ),
                    ),
                    collapsed: const SizedBox(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.history,
                            color: Colormanager.darkGrey,
                          ),
                          selectedColor: Colormanager.primaryOpacity70,
                          contentPadding:
                              const EdgeInsets.only(left: AppPadding.p14),
                          title: Text(
                            'Order History',
                            softWrap: true,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          onTap: () {
                            Get.toNamed(Routes.historyOrder);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.report_rounded),
                          selectedColor: Colormanager.primaryOpacity70,
                          contentPadding:
                              const EdgeInsets.only(left: AppPadding.p14),
                          iconColor: Colormanager.darkGrey,
                          title: Text(
                            'Return History',
                            softWrap: true,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                            Get.toNamed(Routes.historyReturn);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.payments),
                          selectedColor: Colormanager.primaryOpacity70,
                          contentPadding:
                              const EdgeInsets.only(left: AppPadding.p14),
                          iconColor: Colormanager.darkGrey,
                          title: Text(
                            'Payment History',
                            softWrap: true,
                            style: getSemiBoldStyle(
                                color: Colormanager.black,
                                fontSize: FontSize.s14),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                            Get.toNamed(Routes.historyPayment);
                          },
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ],
            )),*/
            // const Divider(),
            // ExpandableNotifier(
            //     child: Column(
            //   children: <Widget>[
            //     ScrollOnExpand(
            //       scrollOnExpand: true,
            //       scrollOnCollapse: false,
            //       child: ExpandablePanel(
            //         theme: const ExpandableThemeData(
            //           headerAlignment: ExpandablePanelHeaderAlignment.center,
            //           tapBodyToCollapse: true,
            //         ),
            //         header: Padding(
            //           padding: const EdgeInsets.only(left: AppPadding.p14),
            //           child: Text(
            //             'Ticket Manage',
            //             style: getBoldStyle(
            //                 color: Colormanager.darkGrey,
            //                 fontSize: FontSize.s16),
            //           ),
            //         ),
            //         collapsed: const SizedBox(),
            //         expanded: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             ListTile(
            //               leading: Icon(
            //                 Icons.airplane_ticket,
            //                 color: Colormanager.darkGrey,
            //               ),
            //               selectedColor: Colormanager.primaryOpacity70,
            //               contentPadding:
            //                   const EdgeInsets.only(left: AppPadding.p14),
            //               title: Text(
            //                 'Received Tickets',
            //                 softWrap: true,
            //                 style: getSemiBoldStyle(
            //                     color: Colormanager.black,
            //                     fontSize: FontSize.s14),
            //               ),
            //               onTap: () {
            //                 Get.back();
            //               },
            //             ),
            //           ],
            //         ),
            //         builder: (_, collapsed, expanded) {
            //           return Expandable(
            //             collapsed: collapsed,
            //             expanded: expanded,
            //             theme: const ExpandableThemeData(crossFadePoint: 0),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // )),
            const Divider(),
            ListTile(
              trailing: const Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: Icon(Icons.person),
              ),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding: const EdgeInsets.only(left: AppPadding.p14),
              iconColor: Colormanager.darkGrey,
              title: Text(
                'Profile Info',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey, fontSize: FontSize.s16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.toNamed(Routes.profile);
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: Icon(Icons.exit_to_app),
              ),
              selectedColor: Colormanager.primaryOpacity70,
              contentPadding: const EdgeInsets.only(left: AppPadding.p14),
              iconColor: Colormanager.darkGrey,
              title: Text(
                'Logout',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey, fontSize: FontSize.s16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.find<DashboardController>().getLogout();
              },
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colormanager.lightGrey.withOpacity(0.5),
          height: AppSize.s50,
          padding: const EdgeInsets.all(AppPadding.p4),
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Develop by Creative Software',
                style: getMediumStyle(
                    color: Colormanager.black, fontSize: FontSize.s16),
              ),
              Text(
                'version: 1.0.1+15',
                style: getMediumStyle(
                    color: Colormanager.darkGrey, fontSize: FontSize.s14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
