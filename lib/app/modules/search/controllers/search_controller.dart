import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchhController extends GetxController {
  late TextEditingController searchC;

  @override
  void onInit() {
    searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchC.dispose();
    super.onClose();
  }
}
