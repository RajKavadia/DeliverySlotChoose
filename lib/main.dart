import 'package:delivery_selection/app/modules/home_page_module/home_page_bindings.dart';
import 'package:delivery_selection/app/modules/home_page_module/home_page_page.dart';
import 'package:delivery_selection/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: HomePageBinding(),
    initialRoute: Routes.HOME_PAGE,
    home: HomePagePage(),
  ));
}
