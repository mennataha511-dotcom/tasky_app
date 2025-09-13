import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'task.dart';
import 'task_controller_event.dart';
import 'task_controller_state.dart';

class TaskControllerBloc
    extends Bloc<TaskControllerEvent, TaskControllerState> {
  TaskControllerBloc() : super(const TaskControllerState()) {
    on<AddTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(state.copyWith(tasks: updatedTasks));
      add(SaveTasks());
    });

    on<ToggleTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks);
      updatedTasks[event.index].isDone = !updatedTasks[event.index].isDone;
      emit(state.copyWith(tasks: updatedTasks));
      add(SaveTasks());
    });

    on<DeleteTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..removeAt(event.index);
      emit(state.copyWith(tasks: updatedTasks));
      add(SaveTasks());
    });

    on<SaveTasks>((event, emit) async {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File filePath = File('${directory.path}/tasks.json');
      final String jsonString = jsonEncode(
        state.tasks.map((t) => t.toJson()).toList(),
      );
      await filePath.writeAsString(jsonString);
    });

    on<LoadTasks>((event, emit) async {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File filePath = File('${directory.path}/tasks.json');

      if (await filePath.exists()) {
        final jsonString = await filePath.readAsString();
        final List<dynamic> jsonList = jsonDecode(jsonString);
        final loadedTasks = jsonList.map((e) => Task.fromJson(e)).toList();
        emit(state.copyWith(tasks: loadedTasks));
      }
    });
  }
}
