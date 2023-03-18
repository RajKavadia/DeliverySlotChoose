import '../../app/modules/home_page_module/home_page_bindings.dart';
import '../../app/modules/home_page_module/home_page_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePagePage(),
      binding: HomePageBinding(),
    ),
  ];
}