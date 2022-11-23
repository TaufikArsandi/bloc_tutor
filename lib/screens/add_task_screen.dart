import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_export.dart';
import 'package:flutter_tasks_app/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text('Add Task'),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: titleController,
          autocorrect: false,
          autofocus: true,
          decoration: const InputDecoration(
              label: Text("Title"), border: OutlineInputBorder()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
                onPressed: () {
                  var task = Task(title: titleController.text);
                  context.read<TaskBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text("Add"))
          ],
        ),
      ]),
    );
  }
}
