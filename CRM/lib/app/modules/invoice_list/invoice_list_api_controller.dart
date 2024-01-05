import 'package:crm/app/modules/invoice_list/invoice_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class InvoiceListController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  RxList<InvoiceList> invoiceList = <InvoiceList>[].obs;
  RxList<InvoiceList> filteredInvoiceList = <InvoiceList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchInvoiceList();
  }

  Future<void> fetchInvoiceList() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final apiUrl = "https://crm.creativesoftware.com.bd/api/invoice-list";
      final headers = {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['invoice_list'];
        invoiceList.assignAll(jsonData.map((e) => InvoiceList.fromJson(e)).toList());

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredInvoiceList.assignAll(invoiceList);
      } else {
        networkError.value = true;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      networkError.value = true;
      throw Exception('Failed to fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to filter subscriptions based on the search criteria.
  void filterInvoiceList(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredInvoiceList.assignAll(invoiceList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredInvoiceList.assignAll(invoiceList.where((InvoiceList) =>
          InvoiceList.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredInvoiceList.assignAll(invoiceList);
  }
}
