import 'task.dart';

class TaskControllerState {
  final List<Task> tasks;
  final bool isLoading;

  const TaskControllerState({this.tasks = const [], this.isLoading = false});

  TaskControllerState copyWith({List<Task>? tasks, bool? isLoading}) {
    return TaskControllerState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoading];
}
