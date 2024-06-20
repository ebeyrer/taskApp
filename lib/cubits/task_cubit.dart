import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/hd_colors.dart';
import '../data/database_helper.dart';
import '../models/task_model.dart';

class TaskCubit extends Cubit<List<TaskModel>> {
  TaskCubit() : super([]);

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  Color getNewColor() {
    int numOfColors = HDColors.colorsLight.length;
    Color color = HDColors.colorsLight[state.length % numOfColors];

    return color;
  }

  Future<void> fetchTasks() async {
    final tasks = await _databaseHelper.getTasks();
    emit(tasks);
  }

  void addTask(TaskModel task) async {
    // Insert the task into the database asynchronously.
    // await _databaseHelper.insertTask(task);

    // Create a new list of tasks, copying the current state.
    final updatedTasks = List<TaskModel>.from(state)
      // Add the new task to the list, assigning it a new color.
      ..add(task.copyWith(
        color: getNewColor(),
      ));

    // Emit the updated list of tasks to update the state.
    emit(updatedTasks);
  }

  void toggleTask(int index) {
    final updatedTasks = List<TaskModel>.from(state);
    updatedTasks[index] = updatedTasks[index].copyWith(
      isCompleted: !updatedTasks[index].isCompleted,
    );
    emit(updatedTasks);
  }

  void deleteTask(int index) {
    final updatedTasks = List<TaskModel>.from(state)..removeAt(index);
    emit(updatedTasks);
  }

  void sortTasks() {
    final updatedTasks = List<TaskModel>.from(state)
      ..sort((a, b) => a.importance.compareTo(b.importance));
    emit(updatedTasks);
  }

  void moveTask(int fromIndex, int index) {
    final updatedTasks = List<TaskModel>.from(state);
    final task = updatedTasks.removeAt(fromIndex);
    updatedTasks.insert(index, task);
    emit(updatedTasks);
  }

  void clearTasks() {
    emit([]);
  }
}
