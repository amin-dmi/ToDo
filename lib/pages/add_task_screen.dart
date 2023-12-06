import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/textfield_controller.dart';
import 'package:todo/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyCustomeAppBar(),
            TitleWidget(),
            TaskTextField(),
            NoteWidget(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      height: 40,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: kLightBlueColor,
        ),
        onPressed: () {
          if (Get.find<TaskController>().isEditing) {
            //ویرایش کردن
            int index = Get.find<TaskController>().index;
            var task = Get.find<TaskController>().tasks[index];

            task.taskTitle = Get.find<TextFieldController>().taskTitle!.text;

            task.taskSubtitle =
                Get.find<TextFieldController>().taskSubTitle!.text;

            Get.find<TaskController>().tasks[index] = task;
          } else {
            //اضاقه کردن
            Get.find<TaskController>().tasks.add(TaskModel(
                  status: false,
                  taskTitle: Get.find<TextFieldController>().taskTitle!.text,
                  taskSubtitle:
                      Get.find<TextFieldController>().taskSubTitle!.text,
                ));
          }

          Get.back();
        },
        child: Text(Get.find<TaskController>().isEditing ? "Edit" : "Add"),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: TextField(
        controller: Get.find<TextFieldController>().taskSubTitle,
        maxLength: 30,
        cursorColor: kLightBlueColor,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            counter: Container(),
            hintText: 'Add Note'),
      ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<TextFieldController>().taskTitle,
        maxLines: 6,
        cursorColor: kLightBlueColor,
        cursorHeight: 40,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        top: 20,
      ),
      child: Text(
        'What Are You Planning?',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}

class MyCustomeAppBar extends StatelessWidget {
  const MyCustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              Get.find<TaskController>().isEditing ? 'EditTask' : 'New Task',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Hero(
          tag: 'hero',
          child: Material(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
          ),
        )
      ],
    );
  }
}
