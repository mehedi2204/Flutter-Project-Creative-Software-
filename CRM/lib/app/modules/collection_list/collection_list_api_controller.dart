import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crm/app/modules/collection_list/collection_list_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectionListController extends GetxController {
  var isLoading = true.obs;
  final RxBool networkError = false.obs;
  RxList<Collection> collectionList = <Collection>[].obs;
  RxList<Collection> filteredCollectionList = <Collection>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCollectionList();
  }

  Future<void> fetchCollectionList() async {
    try {
      isLoading.value = true;
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final apiUrl = "https://crm.creativesoftware.com.bd/api/collection-list"; // Replace with your API URL
      final headers = {
        'Authorization': 'Bearer $accessToken', // Replace with your access token
        'Accept': 'application/json',
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['collection'];
        collectionList.assignAll(jsonData.map((e) => Collection.fromJson(e)).toList());

        // Initialize the filtered collection list with the full collection list.
        filteredCollectionList.assignAll(collectionList);
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

  // Method to filter the collection list based on the search input.
  void filterCollections(String searchText) {
    if (searchText.isEmpty) {
      // If the search text is empty, show all items.
      filteredCollectionList.assignAll(collectionList);
    } else {
      // Filter the collection list based on the search text.
      final filteredList = collectionList.where((collection) {
        return collection.invoiceNo?.toLowerCase().contains(searchText.toLowerCase()) ?? false;
      }).toList();
      filteredCollectionList.assignAll(filteredList);
    }
  }

  void resetFilter() {
    filteredCollectionList.assignAll(collectionList);
  }
}
