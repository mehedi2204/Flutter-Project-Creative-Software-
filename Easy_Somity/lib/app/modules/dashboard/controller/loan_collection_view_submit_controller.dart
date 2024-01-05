import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../const/base_url.dart';
import '../../../const/widgets/custom_snakebar.dart';

class LoanCollectionViewSubmitController extends GetxController {
  var isLoading = false.obs;
  Future<void> submitOrUpdateLoanCollection(
    String accessToken,
    String installmentCcollectionNo,
    String memberNo,
    String loanNo,
    String installmentCollection,
    String previousDue,
    String fine,
    String note,
  ) async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('${BaseUrl.basedUrl}/loan-collection-store'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
        body: {
          'installment_collection_no': installmentCcollectionNo,
          'member_no': memberNo,
          'loan_no': loanNo,
          'today_collection': installmentCollection,
          'previous_due': previousDue,
          'fine': fine,
          'note': note,
        },
      );

      if (response.statusCode == 200) {
        // Data submitted or updated successfully
        print('Success');
        customSnakebar(
            title: 'Your transaction has been successfully submitted',
            description: '',
            color: Colors.deepPurple,
            icon: Icons.error);
      } else {
        // Handle error cases here
        print('Failed ${response.body}');
        customSnakebar(
            title: 'Enter Today Collection Amount',
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
