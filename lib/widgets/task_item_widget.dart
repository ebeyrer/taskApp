import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/task_cubit.dart';
import '../models/task_model.dart';
import '../timer/view/timer_page.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.index});

  final int index;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    TaskModel task = BlocProvider.of<TaskCubit>(context).state[widget.index];

    return Column(
      children: [
        LongPressDraggable<int>(
          data: widget.index,
          childWhenDragging: Transform.scale(
            scale: 0.99,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: task.color.withOpacity(0.5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.index + 1}. ',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        BlocProvider.of<TaskCubit>(context)
                            .toggleTask(widget.index);
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 24,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<TaskCubit>(context)
                            .deleteTask(widget.index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Transform.scale(
                scale: .6,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: task.color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.index + 1}. ',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            BlocProvider.of<TaskCubit>(context)
                                .toggleTask(widget.index);
                          },
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  decoration: task.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<TaskCubit>(context)
                                .deleteTask(widget.index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: DragTarget<int>(
            builder: (context, candidateData, rejectedData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<TaskCubit>(context)
                        .toggleTask(widget.index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: task.color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.index + 1}. ',
                            style: const TextStyle(fontSize: 24),
                          ),
                          Checkbox(
                            value: task.isCompleted,
                            onChanged: (value) {
                              BlocProvider.of<TaskCubit>(context)
                                  .toggleTask(widget.index);
                            },
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TimerPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<TaskCubit>(context)
                                  .deleteTask(widget.index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            onAcceptWithDetails: (details) {
              BlocProvider.of<TaskCubit>(context)
                  .moveTask(details.data, widget.index);
            },
          ),
        ),
        DragTarget<int>(
          builder: (context, candidateData, rejectedData) {
            bool isBeingDragged = candidateData.isNotEmpty;
            return Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isBeingDragged)
                    Icon(Icons.expand, color: Colors.blueAccent),
                  const Divider(color: Colors.black),
                ],
              ),
            );
          },
          onAcceptWithDetails: (details) {
            BlocProvider.of<TaskCubit>(context)
                .moveTask(details.data, widget.index);
          },
        ),
      ],
    );
  }
}
