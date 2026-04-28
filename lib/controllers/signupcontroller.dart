import 'package:get/state_manager.dart';

class SignupController extends GetxController {
  var email;
  var fullname;
  var password;
  var confirmPassword;
  var isPasswordVisible = true.obs;
  signup(email, fullname, pass1, pass2) {
    email = email;
    fullname = fullname;
    password = pass1;
    confirmPassword = pass2;
  }

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
