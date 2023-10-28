import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_new_app/styles/colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/settings/settings.dart';
import '../screens/tasks/add_taskbottomsheet.dart';
import '../screens/tasks/tasks.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: primary,
          onPressed: () {
            showaddtaskbottomsheet();
          },
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.white, width: 4)),
          child: Icon(Icons.add,color:Colors.white ,)),
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(title: Text(  AppLocalizations.of(context)!.todolist)),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label:AppLocalizations.of(context)!.tasks),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
            ]),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];
  showaddtaskbottomsheet() {
    showModalBottomSheet(backgroundColor: Theme.of(context).colorScheme.primary,
        context: context,
      isScrollControlled: true,
         
        builder: (context) {
          return Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          );
        });
  }
}
