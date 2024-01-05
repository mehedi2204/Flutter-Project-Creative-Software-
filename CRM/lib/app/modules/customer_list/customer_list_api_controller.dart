import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm/app/modules/customer_list/customer_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  var customers = <Customer>[].obs;
  var selectedCustomer = Customer().obs; // To store the selected customer
  var filteredCustomers = <Customer>[].obs; // Filtered customer list

  @override
  void onInit() {
    fetchCustomers(); // Fetch customers when the controller initializes
    super.onInit();
  }

  Future<void> fetchCustomers() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final apiUrl = 'https://crm.creativesoftware.com.bd/api/customer-list';
      final accessToken = sharedPreferences.getString('accessToken');
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> customerData = jsonResponse['customer'];

        if (customerData != null) {
          customers.value = customerData
              .map((data) => Customer.fromJson(data))
              .toList(); // Manually parse JSON to List of Customer objects
          filteredCustomers.value = customers; // Initialize filtered list with all customers
          print('Successfully fetched customers.');
        } else {
          // Handle the case where 'customer' key is missing or null
          print('No customer data found in the response.');
        }
      } else {
        networkError.value = true;
        print('API request failed');
      }
    } catch (e) {
      networkError.value = true;
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Filter customers based on business name search
  void filterCustomers(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If search field is empty, show all customers
      filteredCustomers.value = customers;
    } else {
      // Filter customers whose business name contains the search term
      filteredCustomers.value = customers
          .where((customer) =>
          (customer.businessName ?? '').toLowerCase().contains(searchTerm))
          .toList()
          .obs;
    }
  }

  void resetFilter() {
    filteredCustomers.assignAll(customers);
  }
}
