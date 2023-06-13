import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_error_backgound/routes/app_pages.dart';
import 'package:flutter_error_backgound/routes/app_routes.dart';
import 'package:flutter_error_backgound/services/simple_periodic_task.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';

const simplePeriodicTask = "services/simplePeriodicTask.dart";

const simplePeriodic1HourTask = "simplePeriodicTask.dart";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    try {
      SimplePeriodicTask();
    } catch (err) {
      print('--------- ' + err.toString());
      throw Exception(err);
    }
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  await GetStorage.init();
  await Hive.initFlutter();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  Workmanager().registerPeriodicTask(
    simplePeriodicTask,
    simplePeriodic1HourTask,
    frequency: Duration(minutes: 1),
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresCharging: true,
    ),
  );

  await AndroidAlarmManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QHSE Docs Mobile',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.list,
      initialRoute: AppRoutes.MAIN,
      routingCallback: (routing) {},
      onInit: () {},
    );
  }
}
