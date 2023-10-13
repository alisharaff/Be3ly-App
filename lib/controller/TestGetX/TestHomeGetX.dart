import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'TestController.dart';

class HomeGetX extends StatelessWidget {
  const HomeGetX({super.key});

  @override
  Widget build(BuildContext context) {
// Instantiate your class using Get.put() to make it available for all "child" routes there.
    TestController controller = Get.put(TestController());
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [Obx(() => Text("${controller.count}"))],
        ),
        floatingActionButton: FloatingActionButton(
            child:  Icon(Icons.add), onPressed: controller.increment));
  }
}
