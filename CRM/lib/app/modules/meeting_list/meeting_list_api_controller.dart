import 'package:crm/app/modules/meeting_list/meeting_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MeetingController extends GetxController {
  var meetings = <Meeting>[].obs;
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  RxList<Meeting> filteredMeetings = <Meeting>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      isLoading.value = true;
      final response = await http.get(
        Uri.parse('https://crm.creativesoftware.com.bd/api/meeting-list'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> meetingData = jsonResponse['meeting'];

        if (meetingData != null) {
          meetings.assignAll(
            meetingData.map((data) => Meeting.fromJson(data)).toList(),
          );
          print('Successfully fetched meeting list.');
        }
        // Initialize the filteredSubscriptions list with all subscriptions
        filteredMeetings.assignAll(meetings);
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
  void filterMeetings(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredMeetings.assignAll(meetings);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredMeetings.assignAll(meetings.where((Meeting) =>
          Meeting.business?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredMeetings.assignAll(meetings);
  }
}
