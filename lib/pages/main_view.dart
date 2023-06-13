import 'package:flutter/material.dart';
import 'package:flutter_error_backgound/pages/main_controller.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  final MainController _mainController =
      Get.put(MainController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Text('text');
  }
}
