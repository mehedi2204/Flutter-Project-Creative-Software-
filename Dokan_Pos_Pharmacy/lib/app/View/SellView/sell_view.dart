import 'package:dokan_pos/app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import '../../constraints/custom_color.dart';
import '../../constraints/styling.dart';
import 'controller/sell_controller.dart';

class SellView extends GetView<SellController> {
  SellView({Key? key}) : super(key: key);

  String _scanBarcode = '';

  // final List categories = [
  //   "All",
  //   "TShirt",
  //   "Pants",
  //   "Jeans",
  //   "Jackets",
  //   "Shirt",
  // ];

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    _scanBarcode = barcodeScanRes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTop(),
                // _buildCategoriesRow(),
                Expanded(
                  child: controller.obx(
                    (productList) => productList!.isEmpty
                        ? AppText(
                            text: 'No Product Found',
                            color: Colors.blue,
                          )
                        : controller.showGrid.value
                            ? GridView.builder(
                                padding: EdgeInsets.only(top: 16),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount: productList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    elevation: 5.0,
                                    child: Container(
                                      height: 200,
                                      padding: EdgeInsets.all(5),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: productList[index]
                                                  .name,
                                              color: CustomColor.darkGrey,
                                              fontWeight:
                                                  FontWeight.bold,
                                              fontSize: 20,
                                              // textAlign:
                                              //     TextAlign.center,
                                            ),
                                            AppText(
                                              text: productList[index]
                                                  .supplier,
                                              fontSize: 12,
                                            ),
                                            AppText(
                                              text: productList[index]
                                                  .batchNo,
                                              fontSize: 15,
                                            ),
                                            Row(
                                              children: [
                                                AppText(
                                                  text: 'Exp:',
                                                  fontSize: 15,
                                                ),
                                                AppText(
                                                  text: productList[index]
                                                      .expiryDate,
                                                  fontSize: 13,
                                                ),
                                              ],
                                            ),
                                            AppText(
                                              text: '${productList[index]
                                                  .price.toString()}tk',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColor.lightPrimary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: productList.length,
                                padding: EdgeInsets.only(top: 16),
                                itemBuilder: (context, index) => Card(
                                  elevation: 0.0,
                                  child: Container(
                                    height: 120,
                                    padding: EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   width: 100,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(
                                        //           productsController.products[index]["image"]),
                                        //       fit: BoxFit.fill,
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productList[index]
                                                      .supplier
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                // Expanded(
                                                //   child: Text(
                                                //     productsController.products[index]["description"],
                                                //     maxLines: 3,
                                                //     overflow: TextOverflow.ellipsis,
                                                //   ),
                                                // ),
                                                // Text(
                                                //   "\$${productsController.products[index]["price"]}",
                                                //   style: TextStyle(
                                                //     fontWeight: FontWeight.bold,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  ),
                  // return _buildProductsList();
                ),
              ],
            ),
          ),
          // draggableCartView(),
        ],
      ),
      // bottomSheet: bottomSheetContainer(),
    );
  }

  // Align draggableCartView() {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: DraggableScrollableSheet(
  //         initialChildSize: 0.19,
  //         maxChildSize: 1,
  //         minChildSize: 0.19,
  //         expand: true,
  //         builder: (context, controller) {
  //           return /*CartPage();*/
  //               Container(
  //             color: Colors.black,
  //             child: ListView.builder(
  //               itemCount: productList.length,
  //               controller: controller,
  //               itemBuilder: (context, index) {
  //                 if (index == 0) {
  //                   return Padding(
  //                     padding: EdgeInsets.all(10),
  //                     child: Column(
  //                       children: [
  //                         SizedBox(
  //                           width: 50,
  //                           child: Divider(
  //                             color: Colors.white54,
  //                             thickness: 3,
  //                           ),
  //                         ),
  //                         Row(
  //                           children: [
  //                             Icon(
  //                               Icons.shopping_cart,
  //                               size: 25,
  //                               color: Colors.white,
  //                             ),
  //                             SizedBox(
  //                               width: 10,
  //                             ),
  //                             Text(
  //                               'CART',
  //                               style: getBoldStyle(
  //                                   color: Colors.white, fontSize: 18),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 }
  //                 return Container(
  //                   margin: EdgeInsets.all(3),
  //                   decoration: BoxDecoration(
  //                     color: Colors.white10,
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Container(
  //                             width: 60,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                               image: DecorationImage(
  //                                 image: NetworkImage(productsController
  //                                     .products[index]["image"]),
  //                                 fit: BoxFit.fill,
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 20,
  //                           ),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   productsController.products[index]["title"],
  //                                   maxLines: 1,
  //                                   style: TextStyle(color: Colors.white),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Text(
  //                                   '\$ ' +
  //                                       productsController.products[index]
  //                                               ['price']
  //                                           .toString(),
  //                                   style: TextStyle(
  //                                       color: Colors.orange.shade600,
  //                                       fontSize: 15),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         // mainAxisSize: MainAxisSize.min,
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         // crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: [
  //                           Icon(
  //                             Icons.remove,
  //                             color: Colors.white,
  //                             size: 30,
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Text(
  //                             '5',
  //                             style:
  //                                 TextStyle(color: Colors.white, fontSize: 15),
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           ),
  //                           Icon(
  //                             Icons.add,
  //                             color: Colors.white,
  //                             size: 30,
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //
  //                   // ListTile(
  //                   //   leading: Container(
  //                   //     width: 60,
  //                   //     height: 50,
  //                   //     decoration: BoxDecoration(
  //                   //       image: DecorationImage(
  //                   //         image: NetworkImage(productsController
  //                   //             .products[index]["image"]),
  //                   //         fit: BoxFit.fill,
  //                   //       ),
  //                   //     ),
  //                   //   ),
  //                   //   title: Text(
  //                   //     productsController.products[index]["title"],
  //                   //     maxLines: 1,
  //                   //     style: TextStyle(color: Colors.white),
  //                   //   ),
  //                   //   trailing: Row(
  //                   //     mainAxisSize: MainAxisSize.min,
  //                   //     children: [
  //                   //       Text('\$ '+productsController.products[index]['price'].toString(),
  //                   //         style: TextStyle(color: Colors.red.shade600,fontSize: 15),
  //                   //       ),
  //                   //       SizedBox(width: 5,),
  //                   //       Icon(
  //                   //         Icons.remove,
  //                   //         color: Colors.white,
  //                   //       ),
  //                   //       SizedBox(
  //                   //         width: 5,
  //                   //       ),
  //                   //       Text(
  //                   //         '5',
  //                   //         style: TextStyle(color: Colors.white),
  //                   //       ),
  //                   //       SizedBox(
  //                   //         width: 5,
  //                   //       ),
  //                   //       Icon(
  //                   //         Icons.add,
  //                   //         color: Colors.white,
  //                   //       ),
  //                   //     ],
  //                   //   ),
  //                   // ),
  //                 );
  //               },
  //             ),
  //           );
  //         }),
  //   );
  // }

  // Container bottomSheetContainer() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.black,
  //       border: Border.all(color: Colors.black),
  //     ),
  //     height: 70,
  //     width: double.infinity,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Icon(
  //           Icons.save,
  //           color: Colors.grey,
  //           size: 30,
  //         ),
  //         Container(
  //           width: 300,
  //           height: 50,
  //           decoration: BoxDecoration(
  //             color: CupertinoColors.systemGreen,
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Text(
  //                 '\$ 0.00',
  //                 style: getBoldStyle(color: Colors.black, fontSize: 20),
  //               ),
  //               SizedBox(
  //                 width: 100,
  //               ),
  //               Icon(Icons.arrow_forward),
  //               SizedBox(
  //                 width: 10,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // controller.obx((ProductList)=> productList.is)
  // ListView _buildProductsList() {
  //   return ListView.builder(
  //     itemCount: controller.products.length,
  //     padding: EdgeInsets.only(top: 16),
  //     itemBuilder: (context, index) => Card(
  //       elevation: 0.0,
  //       child: Container(
  //         height: 120,
  //         padding: EdgeInsets.all(16),
  //         margin: const EdgeInsets.only(bottom: 8.0),
  //         child: Row(
  //           children: [
  //             Container(
  //               width: 100,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: NetworkImage(
  //                       productsController.products[index]["image"]),
  //                   fit: BoxFit.fill,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(width: 8),
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       productsController.products[index]["title"],
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     Expanded(
  //                       child: Text(
  //                         productsController.products[index]["description"],
  //                         maxLines: 3,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                     Text(
  //                       "\$${productsController.products[index]["price"]}",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 30,
                    child: Icon(Icons.search_outlined),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search for products",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.qr_code_2,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () => scanBarcodeNormal(),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              controller.toggleGrid();
              print(controller.toggleGrid());
            },
            icon: Icon(Icons.filter_list)),
      ],
    );
  }

  // Container _buildCategoriesRow() {
  //   return Container(
  //     height: 35.0,
  //     margin: EdgeInsets.only(top: 16),
  //     child: ListView.builder(
  //       itemCount: categories.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) => Container(
  //         margin: EdgeInsets.only(right: 8),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(4.0),
  //           color: index == 0 ? Colors.black87 : Colors.transparent,
  //         ),
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 16.0,
  //           vertical: 8.0,
  //         ),
  //         child: Text(
  //           categories[index],
  //           style: TextStyle(
  //             color: index == 0 ? Colors.white : Colors.black,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      elevation: 0,
      title: Text(
        "Dokan Pos Pharmacy",
        style: TextStyle(color: Colors.black),
      ),
      // actions: [
      //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      //   IconButton(
      //       onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      // ],
    );
  }
}
