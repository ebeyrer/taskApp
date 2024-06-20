import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/constants/hd_colors.dart';
import 'package:task_app/cubits/task_cubit.dart';
import 'package:task_app/task_list_widget.dart';
import 'package:task_app/timer/view/task_list_page.dart';
import 'package:task_app/widgets/animated_backgroud.dart';
import 'package:task_app/widgets/new_task_dialog_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HDColors.white.withOpacity(.2),
          title: const Text('80HD Task Manager'),
          actions: const [],
        ),
        extendBodyBehindAppBar: true,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).clearTasks();
                },
                child: const Icon(Icons.clear)),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).sortTasks();
                },
                child: const Icon(Icons.sort)),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => NewTaskDialog(),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        body: TaskListPage());
  }
}
