import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../dps report/datewise_dps_report_model.dart';
import '../../signin/loginController.dart';



class DatewiseDPSReportController extends GetxController {
  final AuthController _authController = Get.put(AuthController());

  final RxList<Data> memberData = <Data>[].obs;
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  Future<void> fetchInitialData() async {
    final currentDate = DateTime.now();
    final sevenDaysAgo = currentDate.subtract(Duration(days: 7));
    final formattedFromDate = DateFormat('yyyy-MM-dd').format(sevenDaysAgo);
    final formattedToDate = DateFormat('yyyy-MM-dd').format(currentDate);

    final response = await http.get(
      Uri.parse(
          'https://softwaredemo.shop/Easy_Somity/api/date-wise-dps-report?form_date=$formattedFromDate&to_date=$formattedToDate'),
      headers: {
        'Authorization': 'Bearer ${_authController.user.value.accessToken}',
      },
    );

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      final report = datewiseDPSReport.fromJson(jsonResponse); // Use the new model here

      if (report.data != null) {
        memberData.value = report.data!;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchMemberData() async {
    final fromDate = fromDateController.text;
    final toDate = toDateController.text;

    final response = await http.get(
      Uri.parse(
          'https://softwaredemo.shop/Easy_Somity/api/date-wise-dps-report?form_date=$fromDate&to_date=$toDate'),
      headers: {
        'Authorization': 'Bearer ${_authController.user.value.accessToken}',
      },
    );

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      final report = datewiseDPSReport.fromJson(jsonResponse); // Use the new model here

      if (report.data != null) {
        memberData.value = report.data!;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
