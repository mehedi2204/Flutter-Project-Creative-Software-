import 'package:amvines_rider_new/app/modules/transferorderreport/controllers/transferorderreport_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../const/size_config.dart';

class TransferHeader extends StatelessWidget {
  const TransferHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TransferderreportController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {
                controller.displayDateRangePicker(context);
              },
              child: Container(
                //height: 100,
                //width: size.width / 2.9,
                alignment: Alignment.center,
                //color: Colors.greenAccent,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select Date: ${controller.formdate.value.day}/${controller.formdate.value.month}/${controller.formdate.value.year} - ${controller.todate.value.day}/${controller.todate.value.month}/${controller.todate.value.year}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: InkWell(
              onTap: () {
                controller.getTransferOdrderList();
              },
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.screenWidth! / 4.2,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.flip_camera_android_sharp,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
