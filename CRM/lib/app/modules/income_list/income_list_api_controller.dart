import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crm/app/modules/income_list/income_list_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeListController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  RxList<IncomeVoucher> incomeVoucherList = <IncomeVoucher>[].obs;
  RxList<IncomeVoucher> filteredIncomeVoucherList = <IncomeVoucher>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchIncomeVouchers();
  }

  Future<void> fetchIncomeVouchers() async {
    try {
      isLoading.value = true;
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final apiUrl = "https://crm.creativesoftware.com.bd/api/income-list"; // Replace with your API URL
      final headers = {
        'Authorization': 'Bearer $accessToken', // Replace with your access token
        'Accept': 'application/json',
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['income_voucher'];
        incomeVoucherList.assignAll(jsonData.map((e) => IncomeVoucher.fromJson(e)).toList());

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredIncomeVoucherList.assignAll(incomeVoucherList);
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
  void filterIncomeVouchers(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredIncomeVoucherList.assignAll(incomeVoucherList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredIncomeVoucherList.assignAll(incomeVoucherList.where((IncomeVoucher) =>
          IncomeVoucher.incomeVoucherNo
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredIncomeVoucherList.assignAll(incomeVoucherList);
  }
}
