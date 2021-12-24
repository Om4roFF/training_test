import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_test/domain/bloc/task/task_bloc.dart';
import 'package:training_test/presentation/exercise_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.exercises != null) {
            return ReorderableListView.builder(
              padding: const EdgeInsets.all(8),
              onReorder: (int oldIndex, int newIndex) {
                context.read<TaskBloc>().add(
                    TaskChangeEvent(oldIndex: oldIndex, newIndex: newIndex));
              },
              itemBuilder: (context, index) {
                return ExerciseView(
                  exercise: state.exercises![index],
                  key: ValueKey(state.exercises![index].id),
                );
              },
              itemCount: state.exercises!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      persistentFooterButtons: [
        IconButton(
            onPressed: () {
              context.read<TaskBloc>().add(TaskRefreshEvent());
            },
            icon: const Icon(Icons.refresh)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
      ],
    );
  }
}
