import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/textfield_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: const [
            TopSectionWidget(),
            BottomSectionWidget(),
          ],
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'hero',
      onPressed: () {
        Get.find<TaskController>().isEditing = false;
        Get.find<TextFieldController>().taskTitle!.text = "";
        Get.find<TextFieldController>().taskSubTitle!.text = "";

        Get.toNamed('/addscreen');
      },
      child: Icon(Icons.add),
      backgroundColor: kLightBlueColor,
      elevation: 0,
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 50, top: 20, right: 10),
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context, index) {
                var task = Get.find<TaskController>().tasks[index];

                return ListTile(
                  onLongPress: () {
                    Get.find<TaskController>().tasks.removeAt(index);
                  },
                  title: Text(task.taskTitle ?? ''),
                  subtitle: Text(task.taskSubtitle ?? ''),
                  onTap: () {
                    Get.find<TaskController>().index = index;
                    Get.find<TaskController>().isEditing = true;
                    Get.find<TextFieldController>().taskTitle!.text =
                        task.taskTitle!;

                    Get.find<TextFieldController>().taskSubTitle!.text =
                        task.taskSubtitle!;

                    Get.toNamed('/addscreen');
                  },
                  trailing: Checkbox(
                    side: const BorderSide(color: Colors.black45, width: 1.5),
                    activeColor: kLightBlueColor,
                    onChanged: (Value) {
                      task.status = !task.status!;
                      Get.find<TaskController>().tasks[index] = task;
                    },
                    value: task.status,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.black, height: 1.5);
              },
              itemCount: Get.find<TaskController>().tasks.length);
        }),
      ),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 20),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.bookmarks,
                  color: kLightBlueColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 20),
            child: const Text(
              'All',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 5),
            child: Obx(() {
              return Text(
                '${Get.find<TaskController>().tasks.length} Tasks',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              );
            }),
          )
        ],
      ),
    );
  }
}
