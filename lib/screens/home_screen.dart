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
  int _emptyAddTaskClickCount = 0; // Counter for empty clicks

  @override
  void initState() {
    super.initState();
    _loadTasks();
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
        await file.create();
      }
    } catch (e) {
      debugPrint("Error loading tasks: $e");
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
      debugPrint("Tasks saved successfully.");
    } catch (e) {
      debugPrint("Error saving tasks: $e");
    }
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: _controller.text));
        _controller.clear();
        _saveTasks();
        _emptyAddTaskClickCount = 0;
      });
    } else {
      _emptyAddTaskClickCount++;
      if (_emptyAddTaskClickCount >= 10) {
        _showEasterEggAnimation();
        _emptyAddTaskClickCount = 0;
      }
    }
  }

  void _showEasterEggAnimation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
              '☟︎♏︎●︎◻︎ ❍︎♏︎✏︎ ✋︎ ♋︎❍︎ ⧫︎❒︎♋︎◻︎ ♒︎♏︎❒︎♏︎✏︎ 💧︎□︎❍︎♏︎□︎■︎♏︎ ●︎♏︎⧫︎ ❍︎♏︎ □︎◆︎⧫︎✏︎'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _saveTasks();
    });
  }

  void _editTask(int index, String newTitle) {
    setState(() {
      _tasks[index].title = newTitle;
      _saveTasks();
    });
  }

  List<Task> get filteredTasks {
    return _tasks.where((task) {
      if (_filter == 'Finished') return task.isDone;
      if (_filter == 'Unfinished') return !task.isDone;
      return true;
    }).toList();
  }

  List<Task> get sortedTasks {
    return _sortOrder == 'Newest'
        ? filteredTasks.reversed.toList()
        : filteredTasks; // Oldest
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 226, 109, 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: AppBar(
              title: const Text('TDL'),
              backgroundColor: const Color.fromARGB(255, 226, 109, 0),
              foregroundColor: Colors.white,
              actions: [
                DropdownButton<String>(
                  value: _filter,
                  icon: const Icon(Icons.check, color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      _filter = newValue!;
                    });
                  },
                  items: <String>['All', 'Finished', 'Unfinished']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 16.0),
                DropdownButton<String>(
                  value: _sortOrder,
                  icon: const Icon(Icons.sort, color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortOrder = newValue!;
                    });
                  },
                  items: <String>['Newest', 'Oldest']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 0.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Enter a task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      onPressed: _addTask,
                      child: const Text('Add Task'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0),
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Show a dialog to edit the task
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final TextEditingController editController =
                                      TextEditingController(
                                          text: sortedTasks[index].title);
                                  return AlertDialog(
                                    title: const Text('Edit Task'),
                                    content: TextField(
                                      controller: editController,
                                      decoration: const InputDecoration(
                                          labelText: 'Task Title'),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          _editTask(
                                              _tasks
                                                  .indexOf(sortedTasks[index]),
                                              editController.text);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteTask(_tasks.indexOf(sortedTasks[index])),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
