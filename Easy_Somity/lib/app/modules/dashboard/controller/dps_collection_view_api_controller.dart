import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../const/base_url.dart';
import '../../../const/widgets/custom_snakebar.dart';
import '../../dps/view/dps_collection_view_model.dart';


class DpsCollectionController extends GetxController {
  var isLoading = false.obs;
  var isSearchPerformed = false.obs;
  var dpsCollectionData = DpsCollectionView(
    status: '',
    data: Data(
      areaId: '',
      id: 0,
      memberNo: '',
      memberName: '',
      membersFatherName: '',
      mobileNo: '',
      monthlySavingNo: '',
      amountPerInstallment: 0,
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
        nominee1Nid: null,
        nominee2Nid: null,
        fileAttachment1: null,
        fileAttachment2: null,
        status: null,
        createdAt: '',
        updatedAt: '',
      ),
    ),
    dpsCollection: [],
    totalReceive: 0,
  ).obs;

  Future<void> fetchDpsCollectionData(String accessToken, String memberNo) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${BaseUrl.basedUrl}/dps-collection?member_no=$memberNo'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        dpsCollectionData.value = DpsCollectionView.fromJson(jsonData);
        print('DPS Collection Data: $dpsCollectionData');
      } else {
        // Handle error cases here
        print('Failed to fetch DPS collection data');
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

  void resetDpsCollectionData() {
    dpsCollectionData.value = DpsCollectionView(
      status: '',
      data: Data(
        areaId: '',
        id: 0,
        memberNo: '',
        memberName: '',
        membersFatherName: '',
        mobileNo: '',
        monthlySavingNo: '',
        amountPerInstallment: 0,
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
          nominee1Nid: null,
          nominee2Nid: null,
          fileAttachment1: null,
          fileAttachment2: null,
          status: null,
          createdAt: '',
          updatedAt: '',
        ),
      ),
      dpsCollection: [],
      totalReceive: 0,
    );
  }

  void clearData() {
    // resetDpsCollectionData(); // Reset the data
    isSearchPerformed.value = false; // Reset the search flag
  }

  @override
  void dispose() {
    clearData(); // Clear data when the controller is disposed (screen is removed)
    super.dispose();
  }

}
