import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';
// import 'dart:js';

class TaskData extends ChangeNotifier {
  //make private for safety reasons
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy this'),
    Task(name: 'Buy that')
  ]; //13. move task list to provider
  void addTask(String newTaskTitle) {
    if (newTaskTitle != null) {
      _tasks.add(Task(name: newTaskTitle));
      notifyListeners();
    }
  }

//so other classes can see but cant modify
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  //get is a keyword.
  int get taskCount {
    return _tasks.length;
  }
}
