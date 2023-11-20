import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: kLightBlueColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              color: kLightBlueColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
