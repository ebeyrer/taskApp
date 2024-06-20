import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/cubits/drag_cubit.dart';
import 'package:task_app/cubits/task_cubit.dart';
import 'package:task_app/models/task_model.dart';
import 'package:task_app/widgets/task_item_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DragCubit(),
      child: Center(
        child: BlocBuilder<TaskCubit, List<TaskModel>>(
          builder: (context, state) {
            return BlocProvider.of<TaskCubit>(context).state.isEmpty
                ? const Center(child: Text('No tasks'))
                : ListView.builder(
                    itemCount:
                        BlocProvider.of<TaskCubit>(context).state.length + 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return DragTarget<int>(
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              height: 30,
                            );
                          },
                          onAcceptWithDetails: (details) {
                            BlocProvider.of<TaskCubit>(context)
                                .moveTask(details.data, index);
                          },
                        );
                      }
                      if (index ==
                          BlocProvider.of<TaskCubit>(context).state.length +
                              1) {
                        return DragTarget<int>(
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              height: 60,
                            );
                          },
                          onAcceptWithDetails: (details) {
                            BlocProvider.of<TaskCubit>(context)
                                .moveTask(details.data, index - 2);
                          },
                        );
                      }
                      return TaskWidget(
                        index: index - 1,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
