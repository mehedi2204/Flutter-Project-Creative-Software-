import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../const/base_url.dart';
import '../../../const/widgets/custom_snakebar.dart';
import '../../loan collection/view/loan_report_model.dart';

class LoanCollectionReportController extends GetxController {
  var isLoading = true.obs;
  // Define your variables to store the data here
  var company = Company().obs;
  var data = Data().obs;
  var amountPerInstallment = AmountPerInstallment().obs;


  // Function to fetch data from the API
  Future<void> fetchLoanCollectionReport(String accessToken) async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('${BaseUrl.basedUrl}/latest/loan-collection/report'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 401) {
        final jsonData = json.decode(response.body);

        company.value = Company.fromJson(jsonData['company']);
        data.value = Data.fromJson(jsonData['data']);
        amountPerInstallment.value = AmountPerInstallment.fromJson(jsonData['amount_per_installment']);

        // Data fetched successfully
      } else {
        // Handle error cases here
        print('Failed to fetch data');
        customSnakebar(
            title: 'Your Network Connection is not working',
            description: 'Please Check Your Internet Connection',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (e) {
      print('Error: $e');
    }finally {
      isLoading.value = false;
    }
  }
}
