import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var username;
  var password;
  var isPasswordVisible = false.obs;
  login(user, pass) {
    username = user;
    password = pass;
    if (username == "mkaiwawi1" && password == "melissa123") {
      return true;
    } else {
      return false;
    }
  }

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
