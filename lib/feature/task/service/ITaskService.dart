import '../model/task_model.dart';
import 'package:dio/dio.dart';

abstract class ITaskService {
  final Dio dio;

  ITaskService(this.dio);

  Future<TaskModel> fetchAllTasks();
}
