import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/task_view_model.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  TaskView({Key? key}) : super(key: key);
  final TaskViewModel _viewModel = TaskViewModel();

  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Observer(builder: (_) {
          return Visibility(
            child: const CircularProgressIndicator(),
            visible: _viewModel.isLoading,
          );
        }),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: (_viewModel.model.data ?? []).length,
          itemBuilder: (BuildContext context, int index) {
            final data = _viewModel.model.data;
            return Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(data?[index].avatar ?? ''),
                ),
                title: Text(data?[index].firstName ?? 'NAME', style: context.textTheme.headline5),
                subtitle: Text(data?[index].email ?? 'EMAIL', style: context.textTheme.titleSmall),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewModel.fetchItems(),
        child: const Icon(Icons.download),
      ),
    );
  }
}
