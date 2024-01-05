import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crm/app/modules/expense_list/expense_list_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseListController extends GetxController {
  var isLoading = true.obs;
  RxList<ExpenseVoucher> expenseVoucherList = <ExpenseVoucher>[].obs;
  RxList<ExpenseVoucher> filteredExpenseVoucherList = <ExpenseVoucher>[].obs;
  final RxBool networkError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchExpenseVouchers();
  }

  Future<void> fetchExpenseVouchers() async {
    try {
      isLoading.value = true;
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final apiUrl = "https://crm.creativesoftware.com.bd/api/expense-list"; // Replace with your API URL
      final headers = {
        'Authorization': 'Bearer $accessToken', // Replace with your access token
        'Accept': 'application/json',
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['expense_voucher'];
        expenseVoucherList.assignAll(jsonData.map((e) => ExpenseVoucher.fromJson(e)).toList());

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredExpenseVoucherList.assignAll(expenseVoucherList);
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
  void filterSubscriptions(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredExpenseVoucherList.assignAll(expenseVoucherList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredExpenseVoucherList.assignAll(expenseVoucherList.where((ExpenseVoucher) =>
          ExpenseVoucher.expenseVoucherNo
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredExpenseVoucherList.assignAll(expenseVoucherList);
  }
}
