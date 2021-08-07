import 'package:dsc_mobile_track4/task_mahmoud/modeles/task.dart';
import 'package:dsc_mobile_track4/task_mahmoud/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController controller = TextEditingController();
  bool isp = true;

  bool isComplete = false;
  TaskProvider prov;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    prov = Provider.of<TaskProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade500,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              buildTextField(),
              buildIsComplete(size),
              buildbutton(size, context)
            ],
          ),
        ),
      ),
    );
  }

  Container buildbutton(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo)),
        onPressed: () {
          if (controller.text.isEmpty) {
            return;
          }
          prov.add(
            TaskModel(
              title: controller.text,
              check: isComplete,
              id: DateTime.now().toString(),
            ),
          );
// Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LayoutScreen()));
          Navigator.of(context).pop();
        },
        child: Text(
          'add',
        ),
      ),
    );
  }

  Row buildIsComplete(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'is Complete ?',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          width: size.width / 8,
        ),
        Checkbox(
          value: isComplete,
          onChanged: (val) {
            setState(
              () {
                isComplete = val;
              },
            );
          },
        )
      ],
    );
  }

  TextField buildTextField() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
