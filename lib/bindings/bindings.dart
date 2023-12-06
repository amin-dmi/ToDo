import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/textfield_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}
