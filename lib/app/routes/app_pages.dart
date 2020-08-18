import 'package:get/get.dart';
import 'package:get_lab/app/bindings/home_bindings.dart';
import 'package:get_lab/app/ui/theme/pages/home_page.dart';
import 'package:get_lab/app/ui/theme/pages/teste_page.dart';

import 'app_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.TESTE,
      page: () => TestePage(),
    ),
    //injecao de modules
    GetPage(name: Routes.LOGIN, page: () => HomePage(), binding: HomeBinding()),
  ];
}
