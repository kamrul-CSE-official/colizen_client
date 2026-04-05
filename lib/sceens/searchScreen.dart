import 'package:flutter/material.dart';
import 'package:flutter_application_1/sceens/loginScreen.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => LoginScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              text: "Search",
              onTap: () async {
                final result = await Get.bottomSheet(
                  Container(
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Option 1"),
                          onTap: () => Get.back(result: "Option 1"),
                        ),
                        ListTile(
                          title: Text("Option 2"),
                          onTap: () => Get.back(result: "Option 2"),
                        ),
                      ],
                    ),
                  ),
                );

                if (result != null) {
                  print("Selected: $result");
                  Get.snackbar("Selected", result.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
