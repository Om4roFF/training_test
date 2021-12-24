import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_test/domain/dependency/repository_module.dart';
import 'package:training_test/domain/model/exercise.dart';
import 'dart:math' as math;
part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(TaskState initialState) : super(initialState) {
    on<TaskInitEvent>((event, emit) async {
      exercises = await RepositoryModule.taskRepository().fetchExercises();
      originExercises = [...exercises];
      refreshColor();
      emit(state.copyWith(exercises: exercises));
    });
    on<TaskChangeEvent>((event, emit) {
      print(
          '${event.newIndex} ${event.oldIndex} ${exercises[event.oldIndex].order}');
      var newIndex = event.newIndex;
      if (newIndex > event.oldIndex) {
        newIndex = newIndex - 1;
      }
      var ex = exercises.removeAt(event.oldIndex);
      exercises.insert(newIndex, ex);
      print(exercises.toString());
      reorder(newIndex, event.oldIndex);
      emit(state.copyWith(exercises: exercises));
    });
    on<TaskRefreshEvent>((event, emit) {
      exercises.clear();
      exercises = [...originExercises];
      // refreshColor();
      emit(state.copyWith(exercises: exercises));
    });
  }
  Map<int, Color> colors = {};
  List<Exercise> exercises = <Exercise>[];
  late final List<Exercise> originExercises;

  void refreshColor() {
    for (var ex in exercises) {
      if (colors.containsKey(ex.order)) {
        var color = colors[ex.order];
        ex.setColor(color!);
      } else {
        var color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
        ex.setColor(color);
        colors[ex.order] = color;
      }
    }
  }

  void reorder(var newIndex, var oldIndex) {
    var currentOrder = 1;
    for (int i = 0; i < exercises.length; i++) {
      print(currentOrder);
      if (i == 0) {
        exercises[i].order = 1;
      } else if (exercises[i].order - exercises[i - 1].order < 2 &&
          exercises[i].order < exercises.length) {
        exercises[i].order++;
        // currentOrder++;
      }
    }
  }
}
