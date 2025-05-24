import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double width = Get.width;
        if (width >= 1024) {
        } else {}
        return Container();
      },
    );
  }
}
