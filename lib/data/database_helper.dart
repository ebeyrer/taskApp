import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  late Database _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<void> initializeDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'your_database.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, importance INTEGER, difficulty INTEGER, isCompleted INTEGER, color INTEGER)',
        );
      },
    );
  }

  Future<List<TaskModel>> getTasks() async {
    final List<Map<String, dynamic>> taskMaps = await _database.query('tasks');
    return List.generate(taskMaps.length, (i) {
      return TaskModel(
        title: taskMaps[i]['title'],
        importance: taskMaps[i]['importance'],
        difficulty: taskMaps[i]['difficulty'],
        isCompleted: taskMaps[i]['isCompleted'] == 1,
        color: Color(taskMaps[i]['color']),
      );
    });
  }

  Future<void> insertTask(TaskModel task) async {
    await _database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Implement other CRUD methods as needed
}
