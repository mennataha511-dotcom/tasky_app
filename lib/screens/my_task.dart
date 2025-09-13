import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3/logic/task_controller_bloc.dart';
import '../logic/task_controller_event.dart';
import '../logic/task_controller_state.dart';
import 'main.dart';
import 'new_task.dart';

class MyTask extends StatefulWidget {
  final String? savedName;

  const MyTask({super.key, this.savedName, required String userName});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/profile.jpeg"),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Good Evening, ${widget.savedName ?? ''}",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            "One task at a time. One step\n closer.",
                            style: Theme.of(
                              context,
                            ).textTheme.displaySmall?.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      const Icon(Icons.settings, color: Color(0xFFFFFCFC)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Yuhuu, Your work is ",
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 32),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 36),
                          Text(
                            "almost done! ",
                            style: Theme.of(
                              context,
                            ).textTheme.displayLarge?.copyWith(fontSize: 32),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            "assets/hand.svg",
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const SizedBox(width: 36),
                      Text(
                        "New Task",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<TaskControllerBloc, TaskControllerState>(
                    builder: (context, state) {
                      if (state.tasks.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            "No tasks yet.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.tasks.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final task = state.tasks[index];
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
                                              Brightness.dark ? const Color(0xFF282828) : const Color(0xFFE0E0E0);
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
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NewTask()),
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              "Add New Task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: const Color(0xFF15B86C),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          /* bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),*/
        );
      },
    );
  }
}
