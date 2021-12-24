import 'package:flutter/material.dart';
import 'package:training_test/domain/model/exercise.dart';

class ExerciseView extends StatelessWidget {
  final Exercise exercise;

  const ExerciseView({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: exercise.color,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text('${exercise.id}'),
        subtitle: Text('${exercise.order}'),
        trailing: Text(exercise.orderPrefix),
      ),
    );
  }
}
