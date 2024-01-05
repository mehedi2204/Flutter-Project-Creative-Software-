// import 'package:amvines_rider_new/app/const/app_constant.dart';
// import 'package:amvines_rider_new/app/const/custom_themes.dart';
// import 'package:amvines_rider_new/app/const/size_config.dart';
// import 'package:amvines_rider_new/app/modules/confirmorderreport/controllers/confirmorderreport_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// showHistoryModal(context) {
//   final controller = Get.find<ConfirmorderreportController>();
//   // selectFormDate() async {
//   //   final DateTime? picked = await showDatePicker(
//   //       context: Get.context!,
//   //       initialDate: controller.formDate.value,
//   //       firstDate: DateTime.now(),
//   //       lastDate: DateTime(2101));
//   //   if (picked != null && picked != controller.formDate) {
//   //     controller.formDate.value = picked;
//   //   }
//   // }
//
//   // selectToDate() async {
//   //   final DateTime? picked = await showDatePicker(
//   //       context: Get.context!,
//   //       initialDate: controller.formDate.value,
//   //       firstDate: DateTime.now(),
//   //       lastDate: DateTime(2101));
//   //   if (picked != null && picked != controller.todate) {
//   //     controller.todate.value = picked;
//   //   }
//   // }
//
//   showModalBottomSheet<void>(
//     isScrollControlled: true,
//     context: context,
//     backgroundColor: AppColorsConst.mBandColor,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             child: Wrap(
//               alignment: WrapAlignment.center,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               runSpacing: 18,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const SizedBox(),
//                     Text(
//                       "Order Filter",
//                       style: CustomThemes().headingStyle(18),
//                     ),
//                     InkWell(
//                       onTap: () => Get.back(),
//                       child: const Icon(
//                         Icons.clear,
//                         size: 28,
//                         color: AppColorsConst.dPrimaryColor,
//                       ),
//                     )
//                   ],
//                 ),
//                 Obx(() =>
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Status',
//                                 style: CustomThemes()
//                                     .detailsTextStyle
//                                     .copyWith(fontSize: 18),
//                               ),
//                               TextSpan(
//                                 text: '*',
//                                 style: CustomThemes().detailsTextStyle.copyWith(
//                                     fontSize: 18,
//                                     color: AppColorsConst.orrange),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: AppColorsConst.darkGrey, width: 1.5),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: DropdownButton(
//                             //autofocus: false,
//                             icon: const Padding(
//                               padding: EdgeInsets.only(left: 14),
//                               child: Icon(
//                                 Icons.arrow_drop_down,
//                                 color: AppColorsConst.darkGrey,
//                               ),
//                             ),
//                             iconSize: 35,
//                             elevation: 16,
//                             isExpanded: true,
//                             style: const TextStyle(
//                               color: Colors.black,
//                             ),
//                             underline: Container(
//                               height: 1,
//                             ),
//                             value: controller.selectStatus.value,
//                             onChanged: (newValue) {
//                               controller.selectStatus.value =
//                                   newValue.toString();
//                               controller.update();
//                             },
//                             items: controller.statusList.map((valueItem) {
//                               return DropdownMenuItem(
//                                 value: valueItem,
//                                 child: Text(
//                                   valueItem.toString(),
//                                   style: CustomThemes().headingStyle(18),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         // const SizedBox(
//                         //   height: AppSize.s10,
//                         // )
//                       ],
//                     )),
//                 // Column(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     const SizedBox(
//                 //       height: AppSize.s18,
//                 //     ),
//                 //     Text.rich(
//                 //       TextSpan(
//                 //         children: [
//                 //           TextSpan(
//                 //             text: 'From Date',
//                 //             style: getSemiBoldStyle(
//                 //                 color: Colormanager.lightGrey,
//                 //                 fontSize: AppSize.s16),
//                 //           ),
//                 //           TextSpan(
//                 //             text: AppStrings.star,
//                 //             style: getSemiBoldStyle(
//                 //                 color: Colormanager.red, fontSize: AppSize.s14),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     // Selecttor in Shop
//                 //     const SizedBox(
//                 //       height: AppSize.s4,
//                 //     ),
//                 //     Container(
//                 //       padding: const EdgeInsets.all(AppPadding.p4),
//                 //       height: AppSize.s45,
//                 //       decoration: BoxDecoration(
//                 //         shape: BoxShape.rectangle,
//                 //         border: Border.all(
//                 //             width: AppSize.s1_5, color: Colormanager.grey),
//                 //         borderRadius: const BorderRadius.all(
//                 //           Radius.circular(AppSize.s8),
//                 //         ),
//                 //       ),
//                 //       child: Obx(() => Row(
//                 //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //             children: [
//                 //               Text(
//                 //                   DateFormat('dd-MM-yyyy').format(
//                 //                     DateTime.parse(
//                 //                         controller.formDate.toString()),
//                 //                   ),
//                 //                   style: getBoldStyle(
//                 //                       color: Colormanager.black,
//                 //                       fontSize: FontSize.s14)),
//                 //               InkWell(
//                 //                   onTap: () {
//                 //                     //  selectFormDate();
//                 //                     controller.selectFromDate();
//                 //                   },
//                 //                   child: const Icon(Icons.date_range))
//                 //             ],
//                 //           )),
//                 //     ),
//                 //   ],
//                 // ),
//                 // Column(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     Text.rich(
//                 //       TextSpan(
//                 //         children: [
//                 //           TextSpan(
//                 //             text: 'To Date',
//                 //             style: getSemiBoldStyle(
//                 //                 color: Colormanager.lightGrey,
//                 //                 fontSize: AppSize.s16),
//                 //           ),
//                 //           TextSpan(
//                 //             text: AppStrings.star,
//                 //             style: getSemiBoldStyle(
//                 //                 color: Colormanager.red, fontSize: AppSize.s14),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     // Selecttor in Shop
//                 //     const SizedBox(
//                 //       height: AppSize.s4,
//                 //     ),
//                 //     Container(
//                 //       padding: const EdgeInsets.all(AppPadding.p4),
//                 //       height: AppSize.s45,
//                 //       decoration: BoxDecoration(
//                 //         shape: BoxShape.rectangle,
//                 //         border: Border.all(
//                 //             width: AppSize.s1_5, color: Colormanager.grey),
//                 //         borderRadius: const BorderRadius.all(
//                 //           Radius.circular(AppSize.s8),
//                 //         ),
//                 //       ),
//                 //       child: Obx(() => Row(
//                 //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //             children: [
//                 //               Text(
//                 //                   DateFormat('dd-MM-yyyy').format(
//                 //                     DateTime.parse(
//                 //                         controller.todate.toString()),
//                 //                   ),
//                 //                   style: getBoldStyle(
//                 //                       color: Colormanager.black,
//                 //                       fontSize: FontSize.s14)),
//                 //               InkWell(
//                 //                   onTap: () {
//                 //                     //  selectFormDate();
//                 //                     controller.selectToDate();
//                 //                   },
//                 //                   child: const Icon(Icons.date_range))
//                 //             ],
//                 //           )),
//                 //     ),
//                 //   ],
//                 // ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(vertical: 16),
//                   width: SizeConfig.screenWidth,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Get.back();
//                         controller.getConfirmOrderList();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 14),
//                         child: Text(
//                           'Load Data',
//                           style: CustomThemes().detailsTextStyle.copyWith(
//                               fontSize: 18, color: AppColorsConst.mBandColor),
//                         ),
//                       )),
//                 ),
//               ],
//             ),
//           ));
//     },
//   );
// }
