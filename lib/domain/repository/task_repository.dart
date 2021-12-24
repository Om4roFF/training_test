import 'package:training_test/domain/model/exercise.dart';

abstract class TaskRepository {
  Future<List<Exercise>> fetchExercises();
  Future<bool> sendExercises(List<Exercise> exercises);
}
