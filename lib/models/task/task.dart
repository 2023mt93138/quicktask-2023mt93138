import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Task {
  final String? objectId;
  final String? title;
  final String? description;
  final bool? done; // Whether the task is completed or not
  final DateTime? dueDate; // Task due date

  Task({
    this.objectId,
    this.title,
    this.description,
    this.done,
    this.dueDate,
  });

  // Convert from ParseObject to Task
  Task.fromParseObject(ParseObject parseObject)
      : objectId = parseObject.objectId,
        title = parseObject.get<String>('title'),
        description = parseObject.get<String>('description'),
        done = parseObject.get<bool>('done') ?? false,  // Default to false if not set
        dueDate = _parseDueDate(parseObject.get<DateTime>('dueDate')); // Correctly handle DateTime parsing

  // Method to safely parse dueDate from ParseObject, considering possible null values
  static DateTime? _parseDueDate(DateTime? parseDueDate) {
    if (parseDueDate != null) {
      return parseDueDate;
    }
    return null; // Return null if the value is null or not set
  }

  // Convert Task to a Map (for saving to Parse)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'done': done,
      'dueDate': dueDate?.toIso8601String(),  // Convert DateTime to ISO string for saving
    };
  }

  // Method to save to Parse
  Future<ParseResponse> save() async {
    final parseObject = ParseObject('Task')
      ..set('title', title)
      ..set('description', description)
      ..set('done', done)
      ..set('dueDate', dueDate?.toIso8601String()); // Convert DateTime to string

    return await parseObject.save();
  }
}
