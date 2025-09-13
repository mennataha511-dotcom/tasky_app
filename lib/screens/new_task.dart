import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3/logic/task_controller_bloc.dart';
import '../custom/custom_text_form_field.dart';
import '../logic/task.dart';
import '../logic/task_controller_event.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool isHighPriority = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: _titleController,
                  hintText: "Finish UI design for login screen",
                  labelText: "Task Name",
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter task name'
                      : null,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _descController,
                  hintText:
                      "Finish onboarding UI and hand off to devs by Thursday.",
                  labelText: "Task Description",
                  contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      "High Priority",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    Switch(
                      value: isHighPriority,
                      onChanged: (val) {
                        setState(() {
                          isHighPriority = val;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.white38,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty) {
                final task = Task(
                  name: _titleController.text,
                  description: _descController.text,
                  isHighPriority: isHighPriority,
                  isDone: false,
                );
                context.read<TaskControllerBloc>().add(AddTask(task));
                Navigator.pop(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 8),
                Text(
                  " Add Task",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
