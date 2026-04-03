import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var username;
  var password;
  var isPasswordVisible = true.obs;
  login(email, pass1) {
    username = email;
    password = pass1;
    // if (username == "mkaiwawi1" && password == "melissa123") {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
