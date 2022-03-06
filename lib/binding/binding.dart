import 'package:get/get.dart';
import 'package:purpledog_repo/controller/home_controller.dart';
import 'package:purpledog_repo/view/home.dart';

class Init extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Home_controller());
  }
}
