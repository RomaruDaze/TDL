import 'package:flutter/material.dart';
import '../models/task.dart';
import '../database/shared_preferences_helper.dart'; // Import the SharedPreferencesHelper

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
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper(); // Create an instance of SharedPreferencesHelper

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await _prefsHelper.getTasks(); // Retrieve tasks from SharedPreferences
    setState(() {
      _tasks.clear();
      _tasks.addAll(tasks); // Add retrieved tasks to the list
    });
  }

  void _addTask() async {
    if (_controller.text.isNotEmpty) {
      final newTask = Task(title: _controller.text);
      _tasks.add(newTask); // Add to local list
      await _prefsHelper.saveTasks(_tasks); // Save to SharedPreferences
      _controller.clear();
      _loadTasks(); // Reload tasks to reflect the new addition
      _emptyAddTaskClickCount = 0;
    } else {
      _emptyAddTaskClickCount++;
      if (_emptyAddTaskClickCount >= 10) {
        _showEasterEggAnimation();
        _emptyAddTaskClickCount = 0;
      }
    }
  }

  void _deleteTask(int index) async {
    final taskToDelete = _tasks[index];
    if (taskToDelete.id != null) { // Check if id is not null before using it
        await _prefsHelper.deleteTask(taskToDelete.id!); // Delete from SharedPreferences
    } else {
        // Handle the case where the task ID is null
        print('Task ID is null for task: ${taskToDelete.title}');
    }
    setState(() {
        _tasks.removeAt(index); // This should remove the task from the local list
    });
  }

  void _editTask(int index, String newTitle) async {
    final taskToEdit = _tasks[index];
    taskToEdit.title = newTitle;
    await _prefsHelper.saveTasks(_tasks); // Save updated tasks to SharedPreferences
    setState(() {
      _tasks[index] = taskToEdit; // Update the local list
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
              color: Color.fromARGB(255, 16, 46, 54),
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
              backgroundColor: const Color.fromARGB(255, 16, 46, 54),
              foregroundColor: Colors.white,
              actions: [
                DropdownButton<String>(
                  value: _filter,
                  icon: const Icon(Icons.check, color: Colors.white),
                  dropdownColor: Colors.black,
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
                  dropdownColor: Colors.black,
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
                      title: Text(
                        sortedTasks[index].title,
                        style: TextStyle(
                          decoration: sortedTasks[index].isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      leading: Checkbox(
                        value: sortedTasks[index].isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            sortedTasks[index].isDone = value!;
                            _editTask(_tasks.indexOf(sortedTasks[index]),
                                sortedTasks[index].title);
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
                            onPressed: () {
                                // Ensure the index is correct
                                _deleteTask(_tasks.indexOf(sortedTasks[index])); // This should correctly find the index of the task to delete
                            },
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
