import 'package:dokan_pos/app/View/printer_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constraints/storage_healper.dart';
import '../../routes/app_pages.dart';
import '../SellView/sell_view.dart';
import 'homeViewCard.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dokan Pos Pharmacy'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              HomeCard(
                  image: Image.asset(
                    'assets/calculater.gif',
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ),
                  title: "Sell & Earn",
                  left: 20,
                  right: 10,
                  press: () {
                    Get.toNamed(Routes.SELL);
                  }),
              HomeCard(
                image: Image.asset(
                  'assets/due_book.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Due book",
                left: 10,
                right: 20,
                press: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              HomeCard(
                image: Image.asset(
                  'assets/digital_Money.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Collection",
                left: 20,
                right: 10,
                press: () {},
              ),
              HomeCard(
                image: Image.asset(
                  'assets/shop.png',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Online Shop",
                left: 10,
                right: 20,
                press: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              HomeCard(
                image: Image.asset(
                  'assets/due_book.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Due book",
                left: 20,
                right: 10,
                press: () {},
              ),
              HomeCard(
                image: Image.asset(
                  'assets/due_book.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Due book",
                left: 10,
                right: 20,
                press: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              HomeCard(
                image: Image.asset(
                  'assets/due_book.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Due book",
                left: 20,
                right: 10,
                press: () {},
              ),
              HomeCard(
                image: Image.asset(
                  'assets/due_book.gif',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                title: "Due book",
                left: 10,
                right: 20,
                press: () {},
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          // margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black,
            // borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
              GestureDetector(
                child: Icon(Icons.print_outlined,
                    color: Colors.white, size: 30),
                onTap: (){
                  Get.to(PrinterSettingsView());
                },
              ),
              Icon(Icons.dashboard_outlined, color: Colors.white, size: 30),
              GestureDetector(
                child: Icon(Icons.settings_outlined,
                    color: Colors.white, size: 30),
                onTap: (){
                  StorageHelper.eraseAll();
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
