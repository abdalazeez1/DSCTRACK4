import 'package:dsc_mobile_track4/task_mahmoud/widget/no_element.dart';
import 'package:dsc_mobile_track4/task_mahmoud/widget/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class CompleteScreen extends StatelessWidget {
TaskProvider prov;
List tasks;

  @override
 Widget build(BuildContext context) {
    prov=Provider.of<TaskProvider>(context);
    tasks=prov.completeTask;
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: tasks.length==0?1:tasks.length,

          itemBuilder: (context,index)=>tasks.isEmpty?NoElement():Task(index: index,task: tasks[index],)),
    );
  }
}
