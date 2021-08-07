import 'package:dsc_mobile_track4/task_mahmoud/modeles/task.dart';
import 'package:dsc_mobile_track4/task_mahmoud/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task extends StatefulWidget {
  final int index;
  final TaskModel task;

  Task({this.index, this.task});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TaskProvider prov;

  @override
  Widget build(BuildContext context) {
    prov = Provider.of<TaskProvider>(context);
    // tw=prov.allTask[widget.index];
    print(widget.task.check.toString());
    var size = MediaQuery.of(context).size;
    return Container(
      // : EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      key: ValueKey(widget.task.id),
      child: buildContent(size),
    );
  }

  Row buildContent(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width - 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  widget.task.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Checkbox(
                  value: widget.task.check,
                  onChanged: (v) {
                    prov.updateTask(widget.task, widget.task.check);
                  },
                ),
                IconButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      prov.delete(widget.task.id);
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
