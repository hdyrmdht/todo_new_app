import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_new_app/models/taskemodel.dart';
import 'package:todo_new_app/network/firebase/firebase_manger.dart';
import '../../styles/colors.dart';
import 'tasks_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
DateTime selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      CalendarTimeline(
  initialDate: selecteddate,
  firstDate: DateTime.now().subtract(Duration(days: 365)),
  lastDate: DateTime.now().add(Duration(days: 365)),
  onDateSelected: (date) {
    selecteddate=date;
    setState(() {
      
    });
  },
  leftMargin: 20,
  monthColor:primary,
  dayColor: Colors.grey,
  activeDayColor: Colors.white,
  activeBackgroundDayColor: primary,
  dotsColor: Colors.white,
  selectableDayPredicate: (date) => true,
  locale: 'en_ISO',
),
       Expanded(
         child:StreamBuilder(stream: FirebaseManager.gettasks(selecteddate), builder: (context,Snapshot){
          if(Snapshot.connectionState==ConnectionState.waiting){
          return const Center(child:CircularProgressIndicator() ,);}
        
          if(Snapshot.hasError){
          
            return Center(child:Text("some thing went wrong"));
          }
          
       List<TaskModel> tasks=  Snapshot.data?.docs.map((doc) =>doc.data()).toList()??[];
          return ListView.builder(itemBuilder: (context,index){
            return TaskItem(tasks[index]);
            
          },itemCount: tasks.length,);
         })
         
       ),
      ],
    );
  }
}