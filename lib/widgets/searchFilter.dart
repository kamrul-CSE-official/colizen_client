import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilter extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Example")),
      body: Center(
        child: CustomButton(
          text: "Search",
          onTap: () {
            _openSearchBottomSheet();
          },
        ),
      ),
    );
  }

  void _openSearchBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => searchController.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: "Enter search term...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              autofocus: true,
            ),
            SizedBox(height: 20),
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: searchController.searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchController.searchResults[index]),
                        onTap: () {
                          // Handle selection
                          Get.back(); // Close bottom sheet
                          Get.snackbar("Selected",
                              searchController.searchResults[index]);
                        },
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
    );
  }
}

class SearchController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <String>[].obs;

  // Sample data
  final List<String> allItems = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Strawberry",
    "Watermelon"
  ];

  @override
  void onInit() {
    super.onInit();
    // Listen to search query changes
    ever(searchQuery, (String query) {
      _performSearch(query);
    });
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      searchResults.value = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
