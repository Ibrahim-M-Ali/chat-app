import 'package:get/get.dart';

import '../view-model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
  }
}
