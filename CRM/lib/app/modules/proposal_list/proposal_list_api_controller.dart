import 'package:crm/app/modules/proposal_list/proposal_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProposalController extends GetxController {
  RxList<ProposalList> proposalList = <ProposalList>[].obs;
  RxList<ProposalList> filteredProposalList = <ProposalList>[].obs;
  var isLoading = true.obs;
  final RxBool networkError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final String apiUrl = 'https://crm.creativesoftware.com.bd/api/proposal-list';
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      isLoading.value = true;
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['proposal_list'];
        proposalList.assignAll(data.map((e) => ProposalList.fromJson(e)));

        // Initialize the filteredSubscriptions list with all subscriptions
        filteredProposalList.assignAll(proposalList);
      } else {
        networkError.value = true;
        throw Exception('Failed to load data');
      }
    } catch (error) {
      networkError.value = true;
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to filter subscriptions based on the search criteria.
  void filterProposals(String searchTerm) {
    if (searchTerm.isEmpty) {
      // If the search term is empty, show all subscriptions.
      filteredProposalList.assignAll(proposalList);
    } else {
      // Filter subscriptions by business name containing the search term.
      filteredProposalList.assignAll(proposalList.where((subscription) =>
      subscription.customer?.businessName
          ?.toLowerCase()
          .contains(searchTerm.toLowerCase()) ?? false));
    }
  }

  // Method to reset the filtered list to show all subscriptions.
  void resetFilter() {
    filteredProposalList.assignAll(proposalList);
  }
}
