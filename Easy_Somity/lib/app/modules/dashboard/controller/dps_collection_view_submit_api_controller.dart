import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/widgets/custom_snakebar.dart';

class DpsCollectionViewSubmitController extends GetxController {
  var isLoading = false.obs;
  Future<void> submitOrUpdateDpsCollection(
      String accessToken,
      String dpsCollectionNo,
      String memberNo,
      String monthlySavingNo,
      String installmentCollection,
      String installmentOverdue,
      String fine,
      String note,
      ) async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('https://softwaredemo.shop/Easy_Somity/api/dps-collection-store'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
        body: {
          'dps_collection_no': dpsCollectionNo,
          'member_no': memberNo,
          'monthly_saving_no': monthlySavingNo,
          'todays_received': installmentCollection,
          'installment_overdue': installmentOverdue,
          'fine_investment': fine,
          'collection_note': note,
        },
      );

      if (response.statusCode == 200) {
        // Data submitted or updated successfully
        print('DPS data submitted or updated');
        customSnakebar(
            title: 'Your transaction has been successfully submitted',
            description: '',
            color: Colors.deepPurple,
            icon: Icons.done);
      } else {
        // Handle error cases here
        print('Failed to submit or update DPS data ${response.body}');
        customSnakebar(
            title: 'Enter Today Recieved Amount',
            description: 'For submit transaction',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
