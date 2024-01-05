import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/dashboard/controller/dasboard_controller.dart';
import 'package:easy_somity/app/modules/dashboard/view/app_drawer.dart';
import 'package:easy_somity/app/modules/dps/view/dps_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dps report/dps_report_view.dart';
import '../../loan collection/view/loan_collection_view.dart';
import '../../loan report/loan_report_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        elevation: 0,
        title: AppText(
          text: 'Easy Somity',
          color: CustomColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: ListView(
          children: [
            GridView.builder(
              itemCount: controller.catNames.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print(controller.catNames[index]);

                    if(controller.catNames[index] == 'Loan Collection'){
                      Get.to(() => LoanCollectionView(controller.catNames[index]));
                    }

                    else if(controller.catNames[index] == 'DPS Collection'){
                      Get.to(() => dpsCollectionView(controller.catNames[index]));
                    }

                    else if(controller.catNames[index] == 'Loan Collection Report'){
                      Get.to(() => loanCollectionReportView(controller.catNames[index]));
                    }

                    else if(controller.catNames[index] == 'DPS Collection Report'){
                      Get.to(() => dpsCollectionReportView(controller.catNames[index]));
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: controller.catColor[index],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: controller.catIcons[index],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: controller.catNames[index],
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
            AppText(
              text: 'Summary',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (3 * 250),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.catPrice.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.catColor[index],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: AppText(text: controller.catPrice[index].toString(),fontSize: 20,),
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                              child: AppText(
                            text: controller.catNames[index],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            textAlign: TextAlign.center,
                            color: CustomColor.dPrimary,
                          ))
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
