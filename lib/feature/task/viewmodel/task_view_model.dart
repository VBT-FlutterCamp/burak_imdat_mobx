import 'package:burak_imdat_mobx/core/network/network_manager.dart';
import 'package:burak_imdat_mobx/feature/task/model/task_model.dart';
import 'package:burak_imdat_mobx/feature/task/service/ITaskService.dart';
import 'package:burak_imdat_mobx/feature/task/service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store {
  BuildContext? context;
  late ITaskService _taskService;

  void setContext(BuildContext context) => this.context = context;

  @observable
  TaskModel model = TaskModel();

  @observable
  bool isLoading = false;

  _TaskViewModelBase({this.context}) {
    _taskService = TaskService(NetworkManager.instance.dio);
  }

  void changeLoading() => isLoading = !isLoading;

  @action
  Future<void> fetchItems() async {
    changeLoading();
    model = await _taskService.fetchAllTasks();
    changeLoading();
  }
}
