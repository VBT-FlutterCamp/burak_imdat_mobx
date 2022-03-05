import 'dart:io';

import '../model/task_model.dart';
import 'ITaskService.dart';
import 'package:dio/src/dio.dart';
part './task_service_endpoint.dart';

class TaskService extends ITaskService {
  TaskService(Dio dio) : super(dio);

  @override
  Future<TaskModel> fetchAllTasks() async {
    final response = await dio.get(_TaskServiceEndpoint.USERS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      return TaskModel.fromJson(data);
    }
    throw Exception('NETWORK ERROR');
  }
}
