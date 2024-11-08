import 'package:trilhaapp/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<void> add(Task task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> edit(String id, bool finished) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((task) => task.id == id).first.finished = finished;
  }

  Future<List<Task>> list() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<Task>> listNotFinished() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((task) => !task.isFiniched).toList();
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((task) => task.id == id).first);
  }
}
