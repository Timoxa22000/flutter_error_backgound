import 'dart:io';

import 'package:flutter_error_backgound/models/documenthive.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class SimplePeriodicTask {
  final GetStorage box = GetStorage();

  Box<DocumentHive>? hiveDocuments = null;

  SimplePeriodicTask() {
    loadDocuments();
  }

  Future<void> loadDocuments() async {
    print('----start task' + DateTime.now().toString());

    var isOpen = Hive.isBoxOpen('documents');
    if (!isOpen) {
      Directory? dir = await getExternalStorageDirectory();
      Hive.init(dir!.path);
    }
    var hiveDocuments = await Hive.openBox<DocumentHive>('documents');
    var updateDateTime = DateTime.now();
    print('----end task' + DateTime.now().toString());
  }
}
