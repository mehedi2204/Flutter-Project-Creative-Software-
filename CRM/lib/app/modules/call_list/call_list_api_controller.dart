import 'package:crm/app/modules/call_list/call_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CallListController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  var callList = <CallList>[].obs; // Observable list to store callList data
  RxList<CallList> filteredCallList = <CallList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final String apiUrl = 'https://crm.creativesoftware.com.bd/api/call-list';
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body)['call_list'];
        callList.assignAll(jsonList.map((e) => CallList.fromJson(e)).toList());

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredCallList.assignAll(callList);
      } else {
        networkError.value = true;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      networkError.value = true;
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to filter subscriptions based on the search criteria.
  void filterCallList(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredCallList.assignAll(callList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredCallList.assignAll(callList.where((CallList) =>
          CallList.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredCallList.assignAll(callList);
  }
}
