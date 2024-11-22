// lib/shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task.dart';

class SharedPreferencesHelper {
  static const String _tasksKey = 'tasks';

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasksJson =
        tasks.map((task) => json.encode(task.toMap())).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? tasksJson = prefs.getStringList(_tasksKey);
    if (tasksJson == null) return [];
    return tasksJson.map((task) => Task.fromMap(json.decode(task))).toList();
  }

  Future<void> deleteTask(int id) async {
    final tasks = await getTasks();
    tasks.removeWhere((task) => task.id == id);
    await saveTasks(tasks);
  }
}
