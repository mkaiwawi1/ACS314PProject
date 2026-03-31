import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  // Controllers for the input fields
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable states for UI responsiveness
  var isPasswordVisible = true.obs;
  var isConfirmPasswordVisible = true.obs;
  var isLoading = false.obs;

  // Toggle visibility logic
  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  // Signup logic including validation and API call
  Future<void> signup() async {
    final email = emailController.text.trim();
    final fullname = fullnameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (email.isEmpty ||
        fullname.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
          "https://10.0.2.2/myapi/rootfolder/create.php?emailadd=$email&fullname=User&pass1=$password&pass2=$confirmPassword",
        ),
      );
      debugPrint("Signup response: ${response.body}");
      // Add navigation or success handling here
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
