part of 'task_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}

class LoadingTasksState extends TasksState {}

class LoadedTasksState extends TasksState {}
