import 'package:get/get.dart';
import 'package:get_lab/app/controller/home_controller.dart';
import 'package:get_lab/app/data/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSearchController>(
        () => HomeSearchController(repository: HomeRepository()));
  }
}
