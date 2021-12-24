import 'package:training_test/data/api/services/task_service.dart';
import 'package:training_test/data/repository/task_data_repository.dart';
import 'package:training_test/domain/repository/task_repository.dart';

class RepositoryModule {
  static TaskRepository? _taskRepository;

  static TaskRepository taskRepository() {
    _taskRepository ??= TaskDataRepository(TaskService());
    return _taskRepository!;
  }
}
