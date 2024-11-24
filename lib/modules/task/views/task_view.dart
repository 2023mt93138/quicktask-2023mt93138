import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';  // Ensure Parse is imported
import 'package:quicktask/modules/task/controllers/tasks_controller.dart';
import 'package:quicktask/widgets/task_card.dart';
import 'login_screen.dart'; // Make sure LoginScreen is imported

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get instance of TaskController
    TaskController controller = Get.find();
    
    // Fetch tasks when the screen is loaded
    controller.fetchTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickTask'),
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Ensure that the current user is fetched
              ParseUser? currentUser = await ParseUser.currentUser();
              if (currentUser != null) {
                // If a user is logged in, log them out
                await currentUser.logout();
                Get.snackbar('Logged Out', 'You have been logged out');
                // Navigate to the login screen after logout
                Get.offAll(() => LoginScreen());  // Use Get.offAll() to navigate back to login screen
              } else {
                Get.snackbar('Error', 'No user is logged in');
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.tasks.isNotEmpty) {
          return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: controller.tasks[index]);
            },
          );
        } else {
          return const Center(child: Text("No tasks available!"));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Create Task screen
          Get.toNamed('/createTask');  // Ensure '/createTask' route is defined in GetX routes
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
