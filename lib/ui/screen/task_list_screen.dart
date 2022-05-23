import 'package:basic_task_list/app_exporter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(
        itemRepository: ItemServiceImplementation(),
      )..add(const ItemFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Basic Task List"),
        ),
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.blue,
            useInkWell: true,
          ),
          child: const BodyWidget(),
        ),
      ),
    );
  }
}
