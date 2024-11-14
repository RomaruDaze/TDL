import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  String _filter = 'All';
  String _sortOrder = 'Newest';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the screens initializes
  }

  Future<void> _loadTasks() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/tasks.txt');

      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<String> taskList = contents.split('\n');
        setState(() {
          _tasks.clear();
          _tasks.addAll(taskList.map((task) {
            final parts = task.split('|');
            return Task(title: parts[0], isDone: parts[1] == 'true');
          }).toList());
        });
      } else {
        debugPrint("File does not exist. Creating a new one.");
        await file.create(); // Create a new file if it doesn't exist
      }
    } catch (e) {
      debugPrint("Error loading tasks: $e"); // Log the error
    }
  }

  Future<void> _saveTasks() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/tasks.txt');
      final List<String> taskList = _tasks.map((task) {
        return '${task.title}|${task.isDone}';
      }).toList();
      await file.writeAsString(taskList.join('\n'));
      debugPrint("Tasks saved successfully."); // Use debugPrint for logging
    } catch (e) {
      debugPrint("Error saving tasks: $e"); // Use debugPrint for logging
    }
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: _controller.text));
        _controller.clear();
        _saveTasks(); // Save tasks after adding
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _saveTasks(); // Save tasks after deleting
    });
  }

  List<Task> get filteredTasks {
    return _tasks.where((task) {
      if (_filter == 'Finished') return task.isDone;
      if (_filter == 'Unfinished') return !task.isDone;
      return true; // All
    }).toList();
  }

  List<Task> get sortedTasks {
    return _sortOrder == 'Newest'
        ? filteredTasks.reversed.toList()
        : filteredTasks; // Oldest
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set height for AppBar
        child: Container(
          padding: const EdgeInsets.all(10.0), // Added padding to AppBar
          child: AppBar(
            title: const Text('To-Do List'),
            actions: [
              DropdownButton<String>(
                value: _filter,
                icon: const Icon(Icons.check), // Check button icon only
                onChanged: (String? newValue) {
                  setState(() {
                    _filter = newValue!;
                  });
                },
                items: <String>['All', 'Finished', 'Unfinished']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Text(value), // Text for the dropdown item
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(width: 16.0), // Add space between the two buttons
              DropdownButton<String>(
                value: _sortOrder,
                icon: const Icon(Icons.sort), // Sort button icon only
                onChanged: (String? newValue) {
                  setState(() {
                    _sortOrder = newValue!;
                  });
                },
                items: <String>['Newest', 'Oldest']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Text(value), // Text for the dropdown item
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(10.0), // Added padding of 10 pixels to body
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                    width: 10.0), // Space between TextField and button
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sortedTasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sortedTasks[index].title),
                    leading: Checkbox(
                      value: sortedTasks[index].isDone,
                      onChanged: (bool? value) {
                        setState(() {
                          sortedTasks[index].isDone = value!;
                        });
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteTask(_tasks.indexOf(sortedTasks[index])),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}