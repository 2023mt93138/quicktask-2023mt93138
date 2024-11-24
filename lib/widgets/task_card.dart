import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import '../models/task/task.dart';
import 'package:quicktask/modules/task/controllers/tasks_controller.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    bool isTaskCompleted = task.done ?? false;

    return Card(
      color: isTaskCompleted ? Colors.green[200] : const Color.fromARGB(255, 183, 24, 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 6, // Add elevation for shadow effect
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Margins around the card
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding for content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Task details column (title, description, due date)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text Styling
                  Text(
                    'Title: ${task.title ?? 'No Title'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color for contrast
                    ),
                    overflow: TextOverflow.ellipsis, // Ensure long titles are truncated
                  ),
                  const SizedBox(height: 8), // Space between title and description
                  
                  // Description Text Styling
                  Text(
                    'Description: ${task.description ?? 'No description'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8), // Lighter color for description
                    ),
                    overflow: TextOverflow.ellipsis, // Truncate if it's too long
                  ),
                  const SizedBox(height: 8), // Space between description and due date

                  // Due Date Text Styling (only show if dueDate is available)
                  if (task.dueDate != null)
                    Text(
                      'Due Date: ${DateFormat('MM/dd/yyyy').format(task.dueDate!.toLocal())}',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white.withOpacity(0.7), // Lighter color for due date
                      ),
                    ),
                ],
              ),
            ),
            
            // Action buttons (complete task, delete)
            Row(
              children: [
                // Mark task as completed or incomplete
                IconButton(
                  onPressed: () {
                    controller.updateTask(task.objectId!, !isTaskCompleted);
                  },
                  icon: Icon(
                    isTaskCompleted ? Icons.undo : Icons.done,
                    color: isTaskCompleted ? Colors.blue : Colors.green,
                    size: 28, // Larger icon for better visibility
                  ),
                ),
                
                // Delete task
                IconButton(
                  onPressed: () {
                    controller.deleteTask(task.objectId!);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 28, // Larger icon for better visibility
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
