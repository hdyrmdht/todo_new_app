import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../models/taskemodel.dart';

class FirebaseManager{

    static CollectionReference<TaskModel> gettaskcollection(){
  return  FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>
    (fromFirestore: (snapshot, _) => TaskModel.fromejson(snapshot.data()!),
      toFirestore: (task, _) => task.tojson());
}


    static Future<void> addtask(TaskModel task){

 var collection=gettaskcollection();
 var docref=collection.doc();
 task.id=docref.id;
  return docref.set(task);

  }
  static Stream<QuerySnapshot<TaskModel>>  gettasks(DateTime date){
    return gettaskcollection().where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
  }
  static Future<void>  deletTask(String taskid){
   return gettaskcollection().doc(taskid).delete();
  }
  static void updatetask(TaskModel model){
    gettaskcollection().doc(model.id).update(model.tojson());
  }
}