import 'package:get/get.dart';
import 'package:todo/pages/add_task_screen.dart';
import 'package:todo/pages/home_screen.dart';

class Routs {
  static List<GetPage> get pages => [
        GetPage(
          name: '/homescreen',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/addscreen',
          page: () => const AddTaskScreen(),
        ),
      ];
}
