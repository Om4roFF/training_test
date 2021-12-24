part of 'task_bloc.dart';

class TaskState {

  final List<Exercise>? exercises;

  TaskState({this.exercises});

  TaskState copyWith({List<Exercise>? exercises}){
    return TaskState(
      exercises: exercises ?? this.exercises
    );
  }

}
