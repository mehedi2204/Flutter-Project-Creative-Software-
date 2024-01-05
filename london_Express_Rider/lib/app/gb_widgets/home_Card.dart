import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:flutter/material.dart';

class RiderHomeCard extends StatelessWidget {
  final dynamic countNumber;
  final String? title;
  final String? level;
  const RiderHomeCard(
      {Key? key,
      required this.countNumber,
      required this.title,
      required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorsConst.dPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(level.toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColorsConst.white)),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(countNumber,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColorsConst.white)),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColorsConst.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
