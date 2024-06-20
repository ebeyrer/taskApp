import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskModel extends Equatable {
  final int id = DateTime.now().millisecondsSinceEpoch;
  final String title;
  final int importance;
  final int difficulty;
  bool isCompleted;
  Color color;

  TaskModel({
    required this.title,
    required this.importance,
    required this.difficulty,
    this.isCompleted = false,
    this.color = Colors.white,
  });

  TaskModel copyWith({
    String? title,
    int? importance,
    int? difficulty,
    bool? isCompleted,
    Color? color,
  }) {
    return TaskModel(
      title: title ?? this.title,
      importance: importance ?? this.importance,
      difficulty: difficulty ?? this.difficulty,
      isCompleted: isCompleted ?? this.isCompleted,
      color: color ?? this.color,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'importance': importance,
      'difficulty': difficulty,
      'isCompleted': isCompleted ? 1 : 0,
      'color': color.value,
    };
  }
}
