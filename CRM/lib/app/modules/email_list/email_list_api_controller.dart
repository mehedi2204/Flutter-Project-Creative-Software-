import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crm/app/modules/email_list/email_list_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailListController extends GetxController {
  var isLoading = true.obs;
  var emailList = <Email>[].obs;
  final RxBool networkError = false.obs;
  RxList<Email> filteredEmailList = <Email>[].obs;

  @override
  void onInit() {
    fetchEmailList(); // Fetch email list when the controller initializes
    super.onInit();
  }

  // Inside your EmailListController
  Future<void> fetchEmailList() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      //final apiUrl = 'https://crm.creativesoftware.com.bd/api/email-list';
      final accessToken = sharedPreferences.getString('accessToken');
      final response = await http.get(
        Uri.parse('https://crm.creativesoftware.com.bd/api/email-list'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> emailData = jsonResponse['Email'];

        if (emailData != null) {
          emailList.value = emailData
              .map((data) => Email.fromJson(data))
              .toList();
          print('Successfully fetched email list.');
        } else {
          // Handle the case where 'Email' key is missing or null
          print('No email data found in the response.');
        }
        // Initialize the filteredSubscriptions list with all subscriptions
        filteredEmailList.assignAll(emailList);
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

  void filterEmailList(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredEmailList.assignAll(emailList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredEmailList.assignAll(emailList.where((Email) =>
          Email.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredEmailList.assignAll(emailList);
  }


  // Add a method to get an email by ID if needed
  Email getEmailById(int id) {
    return emailList.firstWhere((email) => email.id == id, orElse: () => Email());
  }
}
