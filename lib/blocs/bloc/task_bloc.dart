import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tasks_app/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TasksEvent, TasksState> {
  TaskBloc() : super(LoadingTasksState()) {
    /// Get Event from UI to Bloc
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<StartedTask>(_onStarted);
  }

  void _onStarted(StartedTask event, Emitter<TasksState> emit) async {
    print("OK");
    emit(LoadingTasksState());
    await Future.delayed(Duration(seconds: 4));
    emit(LoadedTasksState());
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    print("===>> ADD");
    final state = this.state;
    print(state);
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    print("===>> UPDATED");
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    print(state);
    print(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    print("===>> DELETED");
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
    print(state);
  }
}
