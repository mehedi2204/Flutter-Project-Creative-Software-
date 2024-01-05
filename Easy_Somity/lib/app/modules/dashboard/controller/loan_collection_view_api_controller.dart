import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../const/base_url.dart';
import '../../../const/widgets/custom_snakebar.dart';
import '../../loan collection/view/loan_collection_view_model.dart';


class LoanCollectionController extends GetxController {
  var isLoading = false.obs;
  var isSearchPerformed = false.obs;
  var loanCollectionData = LoanCollection(
    status: '',
    data: Data(
      areaId: '',
      id: 0,
      memberNo: '',
      memberName: '',
      membersFatherName: '',
      mobileNo: '',
      installmentAmount: '',
      loanNo: '',
      totalAmount: '',
      areas: Areas(
        id: 0,
        branchId: 0,
        areaName: '',
        district: '',
        status: '',
        createdAt: '',
        updatedAt: '',
      ),
      photos: Photos(
        id: 0,
        memberId: 0,
        memberProfilePhoto: '',
        memberSignature: '',
        memberNid: '',
        createdAt: '',
        updatedAt: '',
      ),
    ),
    installmentCollection: [],
    totalCollection: 0,
  ).obs;

  Future<void> fetchLoanCollectionData(String accessToken, String memberNo) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${BaseUrl.basedUrl}/loan-collection?member_no=$memberNo'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        loanCollectionData.value = LoanCollection.fromJson(jsonData);
      } else {
        // Handle error cases here
        print('Failed to fetch loan collection data');
        customSnakebar(
            title: 'Your Network Connection is not working',
            description: 'Please Check Your Internet Connection',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  var resetLoanCollectionData = LoanCollection(
    status: '',
    data: Data(
      areaId: '',
      id: 0,
      memberNo: '',
      memberName: '',
      membersFatherName: '',
      mobileNo: '',
      installmentAmount: '',
      loanNo: '',
      totalAmount: '',
      areas: Areas(
        id: 0,
        branchId: 0,
        areaName: '',
        district: '',
        status: '',
        createdAt: '',
        updatedAt: '',
      ),
      photos: Photos(
        id: 0,
        memberId: 0,
        memberProfilePhoto: '',
        memberSignature: '',
        memberNid: '',
        createdAt: '',
        updatedAt: '',
      ),
    ),
    installmentCollection: [],
    totalCollection: 0,
  ).obs;


  void clearData() {
    resetLoanCollectionData(); // Reset the data
    isSearchPerformed.value = false; // Reset the search flag
  }

  @override
  void dispose() {
    clearData(); // Clear data when the controller is disposed (screen is removed)
    super.dispose();
  }

}
