import 'package:trilhaapp/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  void addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void editTask(String id, bool finished) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((task) => task.getId() == id).first.setFinished(finished);
  }

  Future<List<Task>> listTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }
}
