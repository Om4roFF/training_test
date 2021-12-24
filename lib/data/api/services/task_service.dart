import 'package:flutter/foundation.dart';
import 'package:training_test/domain/model/exercise.dart';

class TaskService {
  Future<List<Exercise>> fetchExercises() async {
    final responseData = [
      {"id": 1, "order": 1, "order_prefix": ""},
      {"id": 2, "order": 2, "order_prefix": "a"},
      {"id": 3, "order": 2, "order_prefix": "b"},
      {"id": 4, "order": 2, "order_prefix": "c"},
      {"id": 5, "order": 3, "order_prefix": ""},
      {"id": 6, "order": 4, "order_prefix": ""}
    ];
    return await compute(_parseData, responseData);
  }

  Future<bool> sendExercises(List<Exercise> exercises) async {
    print(exercises);
    return true;
  }

  List<Exercise> _parseData(List<dynamic> responseData) {
    return responseData.map((exercise) => Exercise.fromMap(exercise)).toList();
  }
}
