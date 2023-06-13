import 'package:flutter_error_backgound/pages/main_binding.dart';
import 'package:flutter_error_backgound/pages/main_view.dart';
import 'package:flutter_error_backgound/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.MAIN, page: () => MainView(), binding: MainBinding()),
  ];
}
