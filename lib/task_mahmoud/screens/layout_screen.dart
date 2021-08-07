import 'package:dsc_mobile_track4/task_mahmoud/screens/add_new_task.dart';
import 'package:dsc_mobile_track4/task_mahmoud/screens/all_screen.dart';
import 'package:dsc_mobile_track4/task_mahmoud/screens/complete_screen.dart';
import 'package:dsc_mobile_track4/task_mahmoud/screens/incomplete_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {

  TextStyle style = TextStyle(
      fontSize: 16, color: Colors.yellowAccent, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            AllScreen(),
            CompleteScreen(),
            IncompleteScreen(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.indigo.shade500,
        title: Text(
          'To Do',
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AddNewTask()));
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.amber,
              ))
        ],
        bottom: TabBar(
          tabs: [
            Tab(child: Text('Add', style: style)),
            Tab(
              child: Text(
                'In complete',
                style: style,
              ),
            ),
            Tab(
              child: Text(
                'complete',
                style: style,
              ),
            ),
          ],
        ));
  }
}
