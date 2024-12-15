import 'package:get/get.dart';
import 'package:apkmasak/controllers/inspiration_controller.dart';

class InspirationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InspirationController>(() => InspirationController());
  }
}
