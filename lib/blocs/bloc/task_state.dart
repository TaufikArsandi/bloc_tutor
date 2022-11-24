part of 'task_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}

class LoadingTasksState extends TasksState {}

class LoadedTasksState extends TasksState {
  final List<Task> allTasksLoaded;
  const LoadedTasksState({this.allTasksLoaded = const <Task>[]});

  @override
  List<Object> get props => [allTasksLoaded];
}

class ErrorTasksState extends TasksState {}
