import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController? taskTitle;
  TextEditingController? taskSubTitle;

  @override
  void onInit() {
    taskTitle = TextEditingController();
    taskSubTitle = TextEditingController();
    super.onInit();
  }
}
