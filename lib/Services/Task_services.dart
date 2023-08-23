import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/toastMessage.dart';

class taskServices{
  List allTask = [
    {'Head': "Task 1", 'subtitle': "Task 1 Description"},{'Head': "Task 2", 'subtitle': "Task 2 Description"}
];
  List importantTask =[];
  DateTime date=DateTime.now();
  List completedTask = [
    // {'Head':'Complted task Test',
    //   'subtitle':'subtitle test here',
    //   'date':'21/8/23',}
  ];
  List getAllTask() {
    return allTask;
  }

  removeTask(BuildContext context, index) {
    allTask.removeAt(index);
    toastmessage().toastMessage("TASK DELETED SUCCESSFULLY");
  }
  editTask(index, String heading, String subtitle) {
    allTask[index]['Head'] = heading;
    allTask[index]['subtitle'] = subtitle;
  }
  completeTask(index){
    String datTime ="${date.day}/${date.month}/${date.year}";
    Map completed={
      'Head':allTask[index]['Head'],
      'subtitle':allTask[index]['subtitle'],
      'date':datTime,
    };
    allTask.removeAt(index);
    completedTask.add(completed);
  }
  removeCompleteTask(index){
    completedTask.removeAt(index);
  }
}
