// ignore_for_file: unused_local_variable


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_new_app/provider/my_provider.dart';

import '../../models/taskemodel.dart';
import '../../network/firebase/firebase_manger.dart';
import '../../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titlecontroller = TextEditingController();

  var descriptioncontroller = TextEditingController();
  var selecteddate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
         AppLocalizations.of(context)!.addtask,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color:Theme.of(context).colorScheme.onPrimary),
          ),SizedBox(height: 13,),
          TextFormField(
            controller: titlecontroller,
            decoration: InputDecoration(
              label: Text(  AppLocalizations.of(context)!.tasktitle),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              label: Text(  AppLocalizations.of(context)!.taskdesc),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                AppLocalizations.of(context)!.selectdate,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          InkWell(
            onTap: () {
              SelectDate();
            },
            child: Text(
              selecteddate.toString().substring(0, 10),
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color:Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                    title: titlecontroller.text,
                    description: descriptioncontroller.text,
                    date:DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch );
                FirebaseManager.addtask(task);
                 showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Successfuly"),
                        content: Text("Tasks add to firebase"),
actions: [
  ElevatedButton(onPressed: (){
    Navigator.pop(context);
    Navigator.pop(context);
  }, child: Text("thanks")),
],
                      );
                    });
               
              },
              child: Text(  AppLocalizations.of(context)!.addtask)),
        ],
      ),
    );
  }

  SelectDate() async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendate == null) {
      return;
    }
    selecteddate = chosendate;
    setState(() {});
  }
}
