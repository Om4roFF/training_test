import 'package:training_test/data/api/services/task_service.dart';
import 'package:training_test/domain/model/exercise.dart';
import 'package:training_test/domain/repository/task_repository.dart';

class TaskDataRepository extends TaskRepository {
  final TaskService _taskService;

  TaskDataRepository(this._taskService);

  @override
  Future<List<Exercise>> fetchExercises() {
    return _taskService.fetchExercises();
  }

  @override
  Future<bool> sendExercises(List<Exercise> exercises) {
    return _taskService.sendExercises(exercises);
  }
}
