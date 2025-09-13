import 'task.dart';

abstract class TaskControllerEvent {
  const TaskControllerEvent();

  @override
  List<Object?> get props => [];
}

class AddTask extends TaskControllerEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class ToggleTask extends TaskControllerEvent {
  final int index;

  const ToggleTask(this.index);

  @override
  List<Object?> get props => [index];
}

class DeleteTask extends TaskControllerEvent {
  final int index;

  const DeleteTask(this.index);

  @override
  List<Object?> get props => [index];
}

class SaveTasks extends TaskControllerEvent {
  const SaveTasks();
}

class LoadTasks extends TaskControllerEvent {
  const LoadTasks();
}
