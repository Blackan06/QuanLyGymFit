import 'package:get/get.dart';
import '../controllers/age_controller.dart';

class AgeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AgeController>(
      () => AgeController(),
    );
  }
}
