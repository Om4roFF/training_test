part of 'task_bloc.dart';

abstract class TaskEvent {}

class TaskChangeEvent extends TaskEvent {
  final int oldIndex;
  final int newIndex;

  TaskChangeEvent({required this.oldIndex, required this.newIndex});
}

class TaskInitEvent extends TaskEvent {}

class TaskRefreshEvent extends TaskEvent {}
