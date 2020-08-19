import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/controller/connecty_bloc.dart';

import 'app/controller/home_controller.dart';
import 'app/data/repository/home_repository.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_route.dart';
import 'app/ui/theme/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Injecao global
    globalInjections();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      //initialBinding: HomeBinding(),
      //home: HomePageBuilder(),
      getPages: AppPages.pages,
      theme: appThemeData,
    );
  }

  void globalInjections() {
    Get.lazyPut<HomeController>(
      () => HomeController(repository: HomeRepository()),
    );
    //tag: 'teste');

    Get.lazyPut<ConnectyBloc>(
      () => ConnectyBloc(),
    );
  }
}
