import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:get/get.dart';
import 'login_screen.dart'; // Import Login Screen to navigate after logout

Future<void> logout(BuildContext context) async {
  try {
    // Get the current logged-in user
    ParseUser? currentUser = ParseUser.currentUser() as ParseUser?;

    if (currentUser != null) {
      // Logout if a user is logged in
      final response = await currentUser.logout();
      
      if (response.success) {
        // Logout was successful, navigate to Login Screen
        Get.offAll(() => LoginScreen());
        Get.snackbar('Logged Out', 'You have been logged out.');
      } else {
        // Handle logout failure
        Get.snackbar('Error', 'Logout failed: ${response.error?.message}');
      }
    } else {
      // If no user is logged in
      Get.snackbar('Error', 'No user is currently logged in.');
    }
  } catch (e) {
    // Handle unexpected errors
    Get.snackbar('Error', 'An error occurred while logging out: $e');
  }
}
