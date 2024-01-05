import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lbdl_merchant/data/model/categories.dart';
import 'package:lbdl_merchant/data/model/coverage_area_response.dart';
import 'package:lbdl_merchant/data/model/weight_response.dart';

import 'package:lbdl_merchant/presentation/controller/order_create_controller.dart';
import 'package:lbdl_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:lbdl_merchant/presentation/screens/order/component/order_header_section.dart';
import 'package:lbdl_merchant/presentation/screens/resources/color_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/style_manager.dart';

import '../resources/string_manager.dart';
import '../resources/values_manager.dart';

class CreateOrderView extends GetView<OrderCreateController> {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colormanager.white,
      body: SafeArea(
          child: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const OrderHeaderSection(
              title: AppStrings.formTitle,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Expanded(
              child: Obx(() => controller.isLoad.value
                  ? const Center(
                      child: DataLoader(),
                    )
                  : ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(AppPadding.p16),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text.rich(
                        //       TextSpan(
                        //         children: [
                        //           TextSpan(
                        //             text: 'Shop',
                        //             style: getSemiBoldStyle(
                        //                 color: Colormanager.lightGrey,
                        //                 fontSize: AppSize.s14),
                        //           ),
                        //           TextSpan(
                        //             text: AppStrings.star,
                        //             style: getSemiBoldStyle(
                        //                 color: Colormanager.red,
                        //                 fontSize: AppSize.s14),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     // Selecttor in Shop
                        //     Container(
                        //       padding: const EdgeInsets.all(AppPadding.p4),
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.rectangle,
                        //         border: Border.all(
                        //             width: AppSize.s1_5,
                        //             color: Colormanager.grey),
                        //         borderRadius: const BorderRadius.all(
                        //           Radius.circular(AppSize.s8),
                        //         ),
                        //       ),
                        //       child: Obx(() => DropdownButton<Shop>(
                        //             //isDense: true,
                        //             hint: Text(
                        //               controller.selectShop.value,
                        //               style: getSemiBoldStyle(
                        //                 color: Colormanager.black,
                        //               ),
                        //             ),
                        //             value: controller.selectedShop,

                        //             icon: Padding(
                        //               padding:
                        //                   const EdgeInsets.only(left: 15.0),
                        //               child: Icon(
                        //                 Icons.arrow_drop_down,
                        //                 color: Colors.grey[600],
                        //               ),
                        //             ),
                        //             iconSize: 30,
                        //             elevation: 16,
                        //             isExpanded: true,
                        //             style: const TextStyle(
                        //               color: Colors.black,
                        //             ),
                        //             underline: Container(
                        //               height: 0,
                        //             ),
                        //             onChanged: (Shop? newValue) {
                        //               controller.selectedShop = newValue;
                        //               controller.selectShop.value =
                        //                   newValue!.shopName.toString();
                        //             },
                        //             items: controller.shops
                        //                 .map<DropdownMenuItem<Shop>>(
                        //                     (Shop? value) {
                        //               return DropdownMenuItem<Shop>(
                        //                 value: value,
                        //                 child: Text(
                        //                   '${value!.shopName}',
                        //                   style: getSemiBoldStyle(
                        //                       color: Colormanager.black),
                        //                 ),
                        //               );
                        //             }).toList(),
                        //           )),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: AppSize.s10,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Customer Name',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            TextFormField(
                              controller: controller.nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              style: getSemiBoldStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: 'Customer name here',
                              ),
                              validator: (value) {
                                return controller.validFields(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Customer Phone',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            TextFormField(
                              controller: controller.phoneController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style:
                                  getSemiBoldStyle(color: Colormanager.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Customer phone here',
                              ),
                              validator: (value) {
                                return controller.validatePhone(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Customer Address',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            TextFormField(
                              controller: controller.addressController,
                              textInputAction: TextInputAction.next,
                              maxLines: 4,
                              keyboardType: TextInputType.streetAddress,
                              style:
                                  getSemiBoldStyle(color: Colormanager.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Customer address here',
                              ),
                              validator: (value) {
                                return controller.validFields(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        buildTypes(),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'District',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            DropdownSearch<CoverageArea>(
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                // disabledItemFn: (String s) => s.startsWith('I'),
                                searchFieldProps: TextFieldProps(
                                  style: getBoldStyle(
                                      color: Colormanager.black,
                                      fontSize: FontSize.s15),
                                ),
                                itemBuilder: (context, item, isSelected) =>
                                    isSelected
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              item.district!,
                                              style: getBoldStyle(
                                                  color: Colormanager.primary),
                                            ),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.all(8.0),
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            color: Colormanager.lightGrey
                                                .withOpacity(0.2),
                                            child: Text(
                                              item.district!,
                                              style: getBoldStyle(
                                                  color: Colormanager.black,
                                                  fontSize: FontSize.s15),
                                            ),
                                          ),
                              ),
                              items: controller.coverageAreas,

                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle:
                                    getSemiBoldStyle(color: Colormanager.black),
                                dropdownSearchDecoration: const InputDecoration(
                                    // labelText: "Menu mode",
                                    // hintText: "country in menu mode",

                                    ),
                              ),
                              onChanged: (value) {
                                controller.selectedDistrict = value;
                                controller.selectDistrict.value =
                                    value!.district.toString();
                              },
                              itemAsString: (item) => item.district.toString(),

                              // selectedItem: controller.selectArea.value,
                            ),

                            // SearchField<District>(
                            //   suggestions: controller.districts
                            //       .map(
                            //         (e) => SearchFieldListItem<District>(
                            //           e.name.toString(),
                            //           item: e,
                            //           // Use child to show Custom Widgets in the suggestions
                            //           // defaults to Text widget
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Row(
                            //               children: [
                            //                 const SizedBox(
                            //                   width: 10,
                            //                 ),
                            //                 Text(e.name.toString()),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //       .toList(),
                            //   suggestionState: Suggestion.expand,
                            //   textInputAction: TextInputAction.next,
                            //   hint: 'SearchField Example 2',
                            //   hasOverlay: false,
                            //   searchStyle: TextStyle(
                            //     fontSize: 18,
                            //     color: Colors.black.withOpacity(0.8),
                            //   ),
                            //   validator: (x) {
                            //     if (x!.isEmpty) {
                            //       return 'Please Enter a valid State';
                            //     }
                            //     return null;
                            //   },
                            //   searchInputDecoration: InputDecoration(
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.black.withOpacity(0.8),
                            //       ),
                            //     ),
                            //     border: const OutlineInputBorder(
                            //       borderSide: BorderSide(color: Colors.red),
                            //     ),
                            //   ),
                            //   maxSuggestionsInViewPort: 6,
                            //   itemHeight: 50,
                            //   onSuggestionTap: (newValue) {
                            //     controller.selectedDistrict = newValue.item;
                            //     controller.selectDistrict.value =
                            //         newValue.item!.name.toString();
                            //     controller.getCoverageAreas(newValue.item!.id!);
                            //   },
                            // ),

                            //Selecttor in Shop
                            // Container(
                            //   padding: const EdgeInsets.all(AppPadding.p4),
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.rectangle,
                            //     border: Border.all(
                            //         width: AppSize.s1_5,
                            //         color: Colormanager.grey),
                            //     borderRadius: const BorderRadius.all(
                            //       Radius.circular(AppSize.s8),
                            //     ),
                            //   ),
                            //   child: Obx(() => DropdownButton<District>(
                            //         //isDense: true,
                            //         hint: Text(
                            //           controller.selectDistrict.value,
                            //           style: getSemiBoldStyle(
                            //             color: Colormanager.black,
                            //           ),
                            //         ),
                            //         value: controller.selectedDistrict,

                            //         icon: Padding(
                            //           padding:
                            //               const EdgeInsets.only(left: 15.0),
                            //           child: Icon(
                            //             Icons.arrow_drop_down,
                            //             color: Colors.grey[600],
                            //           ),
                            //         ),
                            //         iconSize: 30,
                            //         elevation: 16,
                            //         isExpanded: true,
                            //         style: const TextStyle(
                            //           color: Colors.black,
                            //         ),
                            //         underline: Container(
                            //           height: 0,
                            //         ),
                            //         onChanged: (District? newValue) {
                            //           controller.selectedDistrict = newValue;
                            //           controller.selectDistrict.value =
                            //               newValue!.name.toString();
                            //           controller.getCoverageAreas(newValue.id!);
                            //         },
                            //         items: controller.districts
                            //             .map<DropdownMenuItem<District>>(
                            //                 (District? value) {
                            //           return DropdownMenuItem<District>(
                            //             value: value,
                            //             child: Text(
                            //               '${value!.name}',
                            //               style: getSemiBoldStyle(
                            //                   color: Colormanager.black),
                            //             ),
                            //           );
                            //         }).toList(),
                            //       )),
                            // ),
                          ],
                        ),

                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Area',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            FutureBuilder(future , builder: (context, snapshot) {
                              return DropdownSearch<CoverageArea>(
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,
                                  // disabledItemFn: (String s) => s.startsWith('I'),
                                  searchFieldProps: TextFieldProps(
                                    style: getBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: FontSize.s15),
                                  ),
                                  itemBuilder: (context, item, isSelected) =>
                                      isSelected
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                item.area!,
                                                style: getBoldStyle(
                                                    color:
                                                        Colormanager.primary),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              margin: const EdgeInsets.only(
                                                  bottom: 4),
                                              color: Colormanager.lightGrey
                                                  .withOpacity(0.2),
                                              child: Text(
                                                item.area!,
                                                style: getBoldStyle(
                                                    color: Colormanager.black,
                                                    fontSize: FontSize.s15),
                                              ),
                                            ),
                                ),
                                items: controller.coverageAreas,

                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  baseStyle: getSemiBoldStyle(
                                      color: Colormanager.black),
                                  dropdownSearchDecoration:
                                      const InputDecoration(
                                          // labelText: "Menu mode",
                                          // hintText: "country in menu mode",

                                          ),
                                ),
                                onChanged: (value) {
                                  controller.selectedArea = value;
                                  controller.selectArea.value =
                                      value!.area.toString();
                                },
                                itemAsString: (item) => item.area.toString(),

                                // selectedItem: controller.selectArea.value,
                              );
                            }),

                            //  SearchField<CoverageArea>(
                            //     suggestions: controller.coverageAreas
                            //         .map(
                            //           (e) => SearchFieldListItem<CoverageArea>(
                            //             e.area.toString(),
                            //             item: e,
                            //             // Use child to show Custom Widgets in the suggestions
                            //             // defaults to Text widget
                            //             child: Padding(
                            //               padding: const EdgeInsets.all(8.0),
                            //               child: Row(
                            //                 children: [
                            //                   const SizedBox(
                            //                     width: 10,
                            //                   ),
                            //                   Text(e.area.toString()),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         )
                            //         .toList(),
                            //     suggestionState: Suggestion.expand,
                            //     textInputAction: TextInputAction.next,
                            //     autoCorrect: true,
                            //     hasOverlay: false,
                            //     hint: 'Select Area',
                            //     searchStyle: TextStyle(
                            //       fontSize: 18,
                            //       color: Colors.black.withOpacity(0.8),
                            //     ),
                            //     validator: (x) {
                            //       if (x!.isEmpty) {
                            //         return 'Please Select Area ';
                            //       }
                            //       return null;
                            //     },
                            //     searchInputDecoration: InputDecoration(
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.black.withOpacity(0.8),
                            //         ),
                            //       ),
                            //       border: const OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.red),
                            //       ),
                            //     ),
                            //     maxSuggestionsInViewPort: 6,
                            //     itemHeight: 50,
                            //     onSuggestionTap: (newValue) {
                            //       controller.selectedArea = newValue.item;
                            //       controller.selectArea.value =
                            //           newValue.item!.area.toString();
                            //     },
                            //   ),
                          ],
                        ),

                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Category',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            // Selecttor in Shop
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: AppSize.s1_5,
                                    color: Colormanager.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSize.s8),
                                ),
                              ),
                              child: Obx(() => DropdownButton<ProductType>(
                                    //isDense: true,
                                    hint: Text(
                                      controller.selectCategory.value,
                                      style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                      ),
                                    ),
                                    value: controller.selectedCatefory,

                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    iconSize: 30,
                                    elevation: 16,
                                    isExpanded: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    underline: Container(
                                      height: 0,
                                    ),
                                    onChanged: (ProductType? newValue) {
                                      controller.selectedCatefory = newValue;
                                      controller.selectCategory.value =
                                          newValue!.name.toString();
                                    },
                                    items: controller.categories
                                        .map<DropdownMenuItem<ProductType>>(
                                            (ProductType? value) {
                                      return DropdownMenuItem<ProductType>(
                                        value: value,
                                        child: Text(
                                          '${value!.name}',
                                          style: getSemiBoldStyle(
                                              color: Colormanager.black,
                                              fontSize: FontSize.s14),
                                        ),
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Weight',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            // Selecttor in Shop
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: AppSize.s1_5,
                                    color: Colormanager.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSize.s8),
                                ),
                              ),
                              child: Obx(() => DropdownButton<Weight>(
                                    //isDense: true,
                                    hint: Text(
                                      controller.selectWeight.value,
                                      style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                      ),
                                    ),
                                    value: controller.selectedWeight,

                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    iconSize: 30,
                                    elevation: 16,
                                    isExpanded: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    underline: Container(
                                      height: 0,
                                    ),
                                    onChanged: (Weight? newValue) {
                                      controller.selectedWeight = newValue;
                                      controller.selectWeight.value =
                                          newValue!.title.toString();
                                    },
                                    items: controller.weights
                                        .map<DropdownMenuItem<Weight>>(
                                            (Weight? value) {
                                      return DropdownMenuItem<Weight>(
                                        value: value,
                                        child: Text(
                                          '${value!.title}',
                                          style: getSemiBoldStyle(
                                              color: Colormanager.black,
                                              fontSize: FontSize.s14),
                                        ),
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                       /* Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Pickup Time',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            // Selecttor in Shop
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: AppSize.s1_5,
                                    color: Colormanager.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSize.s8),
                                ),
                              ),
                              child: Obx(() => DropdownButton<PickupTime>(
                                    //isDense: true,
                                    hint: Text(
                                      controller.selectPickupTime.value,
                                      style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                      ),
                                    ),
                                    value: controller.selectedPickupTime,

                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    iconSize: 30,
                                    elevation: 16,
                                    isExpanded: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    underline: Container(
                                      height: 0,
                                    ),
                                    onChanged: (PickupTime? newValue) {
                                      controller.selectedPickupTime = newValue;
                                      controller.selectPickupTime.value =
                                          newValue!.pickUp.toString();
                                    },
                                    items: controller.pickuptimes
                                        .map<DropdownMenuItem<PickupTime>>(
                                            (PickupTime? value) {
                                      return DropdownMenuItem<PickupTime>(
                                        value: value,
                                        child: Text(
                                          '${value!.pickUp}',
                                          style: getSemiBoldStyle(
                                              color: Colormanager.black,
                                              fontSize: FontSize.s14),
                                        ),
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ],
                        ),*/
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Pickup Date',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            // Selecttor in Shop
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p4),
                              height: AppSize.s45,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: AppSize.s1_5,
                                    color: Colormanager.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSize.s8),
                                ),
                              ),
                              child: Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          DateFormat('dd-MM-yyyy').format(
                                            DateTime.parse(controller
                                                .selectedDate
                                                .toString()),
                                          ),
                                          style: getBoldStyle(
                                              color: Colormanager.black,
                                              fontSize: FontSize.s14)),
                                      InkWell(
                                          onTap: () {
                                            controller.selectDate();
                                          },
                                          child: const Icon(Icons.date_range))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Invoice Value(TK)',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            TextFormField(
                              controller: controller.collectionController,
                              textInputAction: TextInputAction.done,
                              style:
                                  getSemiBoldStyle(color: Colormanager.black),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Invoice Value here'),
                              validator: (value) {
                                return controller.validFields(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Delivery Note',
                                    style: getSemiBoldStyle(
                                        color: Colormanager.lightGrey,
                                        fontSize: AppSize.s14),
                                  ),
                                  /*TextSpan(
                                    text: AppStrings.star,
                                    style: getSemiBoldStyle(
                                        color: Colormanager.red,
                                        fontSize: AppSize.s14),
                                  ),*/
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s4,
                            ),
                            TextFormField(
                              controller: controller.deliveryNoteController,
                              textInputAction: TextInputAction.done,
                              style:
                                  getSemiBoldStyle(color: Colormanager.black),
                              keyboardType: TextInputType.url,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Delivery note here'),
                              /*validator: (value) {
                                return controller.validFields(value!);
                              },*/
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Obx(() => CheckboxListTile(
                            title: Text(
                              'Partially Delivered ?'.toUpperCase(),
                              style: getBoldStyle(
                                  color: Colormanager.black,
                                  fontSize: FontSize.s14),
                            ),
                            value: controller.isPertial.value,
                            onChanged: (value) {
                              controller.isPertial.value =
                                  !controller.isPertial.value;
                            })),
                        const SizedBox(
                          height: AppSize.s65,
                        ),
                        SizedBox(
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.getVlidation();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p14),
                                child: Text(
                                  AppStrings.submit,
                                  style: getSemiBoldStyle(
                                      color: Colormanager.white,
                                      fontSize: FontSize.s18),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: AppSize.s65,
                        ),
                      ],
                    )),
            )
          ],
        ),
      )),
    );
  }

  Column buildTypes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Delivery Type',
                style: getSemiBoldStyle(
                    color: Colormanager.lightGrey, fontSize: AppSize.s14),
              ),
              TextSpan(
                text: AppStrings.star,
                style: getSemiBoldStyle(
                    color: Colormanager.red, fontSize: AppSize.s14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        // Selecttor in Branch
        Container(
          padding: const EdgeInsets.all(AppPadding.p4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: AppSize.s1_5, color: Colormanager.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),
          child: Obx(
            () => DropdownButton(
              // Initial Value
              value: controller.selectType.value,

              // Down Arrow Icon
              icon: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p14),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colormanager.lightGrey,
                ),
              ),
              iconSize: AppSize.s35,
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(
                color: Colors.black,
              ),
              underline: Container(
                height: 1,
              ),
              // Array list of items
              items: controller.types.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.black, fontSize: FontSize.s14),
                  ),
                );
              }).toList(),

              onChanged: (String? newValue) {
                controller.selectType.value = newValue!;
              },
            ),
          ),
        ),
      ],
    );
  }
}
