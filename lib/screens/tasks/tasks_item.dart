import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_new_app/models/taskemodel.dart';
import 'package:todo_new_app/network/firebase/firebase_manger.dart';

import '../../styles/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(color: Theme.of(context).colorScheme.onBackground,
      elevation: 12,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              FirebaseManager.deletTask(task.id);
            },
            backgroundColor: redcolor,
            label: "Delete",
            icon: Icons.delete,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                 
                    color: task.isDone?green: primary),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color:task.isDone?green: primary),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey[300]),
                  ),
                ],
              ),
              Spacer(),
              InkWell(onTap: (){
               task.isDone=true;
                FirebaseManager.updatetask(task);
              },
                child: Container(margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child:task.isDone?Text("isDone!",style: TextStyle(color: Colors.white,fontSize: 18),): Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:task.isDone?green: primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
