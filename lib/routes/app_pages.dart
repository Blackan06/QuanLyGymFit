import 'package:get/get.dart';
import '../bindings/age_binding.dart';
import '../screens/age.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Age;

  static final routes = [
    GetPage(
      name: _Paths.Age,
      page: () => AgeScreen(),
      binding: AgeBinding(),
    ),
  ];
}
