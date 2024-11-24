import 'package:quicktask/modules/task/views/task_view.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:quicktask/models/task/task.dart';  // Import the Task model

// In your TaskController
class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  var taskTitle = TextEditingController();
  var taskDesc = TextEditingController();
  
  // Reactive variable for due date
  var dueDate = Rx<DateTime?>(null);  // This is the correct way to define an Rx<DateTime?>

  // Method to save a task
  Future<void> saveTodo(String title, String description) async {
    if (title.isEmpty || description.isEmpty || dueDate.value == null) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    DateTime localDueDate = dueDate.value?.toLocal() ?? DateTime.now();
    // Create a new ParseObject (task)
    ParseObject task = ParseObject('Task')
      ..set('title', title)
      ..set('description', description)
      ..set('done', false)  // Default to not completed
      ..set('dueDate', localDueDate);  // Correct way to access the Rx value
    // Save the task
    final response = await task.save();
    if (response.success) {
      Get.snackbar('Success', 'Task added successfully');
      taskTitle.clear();
      taskDesc.clear();
      dueDate.value = null;
      Get.offAll(() => const TasksScreen());
      await fetchTasks();
    } else {
      Get.snackbar('Error', 'Failed to add task');
    }
  }

  // Method to fetch tasks from Back4App
  Future<void> fetchTasks() async {
    QueryBuilder<ParseObject> queryTask = QueryBuilder<ParseObject>(ParseObject('Task'));
    final ParseResponse apiResponse = await queryTask.query();
    if (apiResponse.success && apiResponse.results != null) {
      List<Task> fetchedTasks = apiResponse.results!.map((e) => Task.fromParseObject(e)).toList();
      tasks.value = fetchedTasks;
    } else {
      print('Failed to fetch tasks: ${apiResponse.error?.message}');
    }
  }

  // Update task status (toggle completion)
  Future<void> updateTask(String objectId, bool isCompleted) async {
    final task = ParseObject('Task')..objectId = objectId;
    task.set('done', isCompleted); // Update the 'done' field

    final response = await task.save();

    if (response.success) {
      Get.snackbar('Success', 'Task updated');
      await fetchTasks(); // Refresh the task list after update
    } else {
      Get.snackbar('Error', 'Failed to update task');
    }
  }

  // Delete a task
  Future<void> deleteTask(String objectId) async {
    final task = ParseObject('Task')..objectId = objectId;
    final response = await task.delete();

    if (response.success) {
      Get.snackbar('Success', 'Task deleted');
      await fetchTasks(); // Refresh the task list after deletion
    } else {
      Get.snackbar('Error', 'Failed to delete task');
    }
  }
}
