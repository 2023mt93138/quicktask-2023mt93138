import 'package:quicktask/modules/task/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// Import login screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickTask'),
        actions: [
          // Only show logout button if the user is logged in
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Ensure that the current user is fetched
              ParseUser? currentUser = await ParseUser.currentUser();
              if (currentUser != null) {
                // If a user is logged in, log them out
                await currentUser.logout();
                Get.snackbar('Logged Out', 'You have been logged out');
                // Navigate back to login screen
                Get.offAll(() => LoginScreen());  // Use Get.offAll() to go to login screen
              } else {
                Get.snackbar('Error', 'No user is logged in');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Home Screen - Logged In"),
      ),
    );
  }
}
