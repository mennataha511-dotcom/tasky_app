import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/task_controller_bloc.dart';
import '../logic/task_controller_event.dart';
import '../logic/task_controller_state.dart';
import 'main.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  @override
  void initState() {
    super.initState();
    context.read<TaskControllerBloc>().add(const LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, _) {
        bool isDark = currentTheme == ThemeMode.dark;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text("To Do Tasks"), leading: BackButton()),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),

                  BlocBuilder<TaskControllerBloc, TaskControllerState>(
                    builder: (context, state) {
                      final todoTasks = state.tasks
                          .where((task) => !task.isDone)
                          .toList();
                      if (todoTasks.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            "No ToDo tasks.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: todoTasks.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final task = todoTasks[index];
                          return Material(
                            color: isDark ? Colors.black : Colors.white,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              leading: Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        MaterialState.selected,
                                      )) {
                                        return const Color(0xFF15B86C);
                                      }
                                      return Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF282828)
                                          : const Color(0xFFE0E0E0);
                                    }),
                                checkColor: const Color(0xFFFFFCFC),
                                value: task.isDone,
                                onChanged: (_) {
                                  context.read<TaskControllerBloc>().add(
                                    ToggleTask(index),
                                  );
                                },
                              ),
                              title: Text(
                                task.name,
                                style: TextStyle(
                                  decoration: task.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: isDark ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                task.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      fontSize: 14,
                                      color: isDark ? Colors.white : Colors.black,
                                    ),
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    context.read<TaskControllerBloc>().add(
                                      DeleteTask(index),
                                    );
                                  }
                                },
                                itemBuilder: (context) => const [
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        SizedBox(width: 8),
                                        Text("Delete"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
