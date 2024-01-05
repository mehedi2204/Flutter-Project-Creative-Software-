import 'package:crm/app/modules/ticket_list/ticket_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TicketListController extends GetxController {
  var ticketList = <TicketList>[].obs;
  var isLoading = true.obs;
  final RxBool networkError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final String apiUrl = 'https://crm.creativesoftware.com.bd/api/ticket-list';
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(
        Uri.parse('$apiUrl'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['ticket_list'];
        ticketList.assignAll(data.map((e) => TicketList.fromJson(e)));
      } else {
        networkError.value = true;
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      networkError.value = true;
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
