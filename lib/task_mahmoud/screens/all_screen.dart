import 'package:dsc_mobile_track4/task_mahmoud/modeles/task.dart';
import 'package:dsc_mobile_track4/task_mahmoud/provider.dart';
import 'package:dsc_mobile_track4/task_mahmoud/widget/no_element.dart';
import 'package:dsc_mobile_track4/task_mahmoud/widget/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<TaskModel> tasks;

class AllScreen extends StatelessWidget {
  TaskProvider prov;

  @override
  Widget build(BuildContext context) {
    prov = Provider.of<TaskProvider>(context);
    tasks = prov.allTask;

    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: tasks.length == 0 ? 1 : tasks.length,
        itemBuilder: (context, index) {
          return tasks.length == 0
              ? NoElement()
              : Task(
                  index: index,
                  task: tasks[index],
                );
        },
      ),
    );
  }
}
