import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  const UpdateStatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text('Update Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.statusC,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Status",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  // borderSide: BorderSide(color: Colors.red[900]!),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "UPDATE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
