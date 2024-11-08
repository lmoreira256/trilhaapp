import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task.dart';
import 'package:trilhaapp/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _taskTitleController = TextEditingController();
  final _taskRepostory = TaskRepository();

  var _tasks = const <Task>[];
  var _filerOnlyFinishedTasks = false;

  @override
  void initState() {
    super.initState();

    getTasks();
  }

  void getTasks() async {
    _tasks = _filerOnlyFinishedTasks
        ? await _taskRepostory.listNotFinished()
        : await _taskRepostory.list();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _taskTitleController.text = '';
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text('Adicionar Tarefa'),
                content: TextField(
                  controller: _taskTitleController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () async {
                      var task = Task(_taskTitleController.text, false);

                      await _taskRepostory.add(task);
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filtrar apenas não concluídos',
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: _filerOnlyFinishedTasks,
                    onChanged: (bool value) {
                      _filerOnlyFinishedTasks = value;
                      getTasks();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (BuildContext bc, int index) {
                  var task = _tasks[index];
                  return Dismissible(
                    key: Key(task.id),
                    onDismissed: (DismissDirection dismissDirection) async {
                      await _taskRepostory.remove(task.id);
                      getTasks();
                    },
                    child: ListTile(
                      title: Text(task.description),
                      trailing: Switch(
                        value: task.isFiniched,
                        onChanged: (bool value) async {
                          await _taskRepostory.edit(task.id, value);
                          getTasks();
                        },
                      ),
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
