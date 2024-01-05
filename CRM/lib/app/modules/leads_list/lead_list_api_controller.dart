import 'package:crm/app/modules/leads_list/lead_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LeadListController extends GetxController {
  var isLoading = true.obs;
  RxList<LeadList> leadList = <LeadList>[].obs;
  final RxBool networkError = false.obs;
  RxList<LeadList> filteredLeadList = <LeadList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final String apiUrl = 'https://crm.creativesoftware.com.bd/api/lead-list';
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(
        Uri.parse('$apiUrl'), // Replace with your API endpoint
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body)['lead_list'];
        leadList.assignAll(jsonList.map((e) => LeadList.fromJson(e)).toList());

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredLeadList.assignAll(leadList);
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
  void filterLeadList(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredLeadList.assignAll(leadList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredLeadList.assignAll(leadList.where((LeadList) =>
          LeadList.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredLeadList.assignAll(leadList);
  }
}
