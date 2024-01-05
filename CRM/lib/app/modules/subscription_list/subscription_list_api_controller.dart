import 'package:crm/app/modules/subscription_list/subscription_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  RxList<Subscription> subscriptions = <Subscription>[].obs;
  RxList<Subscription> filteredSubscriptions = <Subscription>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final apiUrl = "https://crm.creativesoftware.com.bd/api/subscription-list";
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization": "Bearer $accessToken",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Assuming your API response contains a list of subscriptions
        final List<dynamic> subscriptionList = data['subscription'];

        // Convert the JSON data into Subscription objects
        subscriptions.assignAll(
          subscriptionList.map((json) => Subscription.fromJson(json)).toList(),
        );

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredSubscriptions.assignAll(subscriptions);
      } else {
        networkError.value = true;
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      networkError.value = true;
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Method to filter subscriptions based on the search criteria.
  void filterSubscriptions(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredSubscriptions.assignAll(subscriptions);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredSubscriptions.assignAll(subscriptions.where((subscription) =>
      subscription.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredSubscriptions.assignAll(subscriptions);
  }
}
