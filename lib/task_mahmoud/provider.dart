import 'package:dsc_mobile_track4/task_mahmoud/screens/all_screen.dart';
import 'package:flutter/foundation.dart';

import 'modeles/task.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _allTask = [];
  List<TaskModel> _incompleteTask = [];
  List<TaskModel> _completeTask = [];

  get allTask => _allTask;

  get completeTask =>
      _allTask.where((element) => (element.check == true)).toList() ?? [];

  get inCompleteTask =>
      _allTask.where((element) => (element.check == false)).toList() ?? [];

  void add(TaskModel task) {
    _allTask.add(task);
    notifyListeners();
  }

  void updateTask(TaskModel task, bool val) {
    tasks.forEach((element) {
      if (element.id == task.id) {
        element.check = !val;
      }
    });
    notifyListeners();
  }

  void delete(
    String id,
  ) {
    _allTask.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
