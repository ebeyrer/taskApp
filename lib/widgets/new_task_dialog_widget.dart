import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/cubits/task_cubit.dart';
import 'package:task_app/models/task_model.dart';

class NewTaskDialog extends StatelessWidget {
  NewTaskDialog({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _importanceController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Task',
              ),
            ),
            TextField(
              controller: _importanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Importance Rating',
              ),
            ),
            TextField(
              controller: _difficultyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Difficulty Rating', hintText: '1-10'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TaskCubit>(context).addTask(
                  TaskModel(
                      title: _titleController.text,
                      importance: int.parse(_importanceController.value.text),
                      difficulty: int.parse(_difficultyController.value.text),
                      isCompleted: false),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
