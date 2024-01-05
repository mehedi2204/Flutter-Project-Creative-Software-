import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../const/size_config.dart';
import '../controllers/confirmorderreport_controller.dart';

class ConfirmHeader extends StatelessWidget {
  const ConfirmHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ConfirmorderreportController controller;

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
                    "Select Date: ${controller.formdate.value.day.toString()}/${controller.formdate.value.month.toString()}/${controller.formdate.value.year.toString()} - ${controller.todate.value.day.toString()}/${controller.todate.value.month.toString()}/${controller.todate.value.year.toString()}",
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
                controller.getConfirmOrderList();
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
