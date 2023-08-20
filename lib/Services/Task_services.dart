import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class taskServices {
  List allTask = [
    {'Head': "Heading 1 Test", 'subtitle': "subtitle Test"},{'Head': "Heading 1 Test", 'subtitle': "subtitle Test"}
];
  DateTime date=DateTime.now();
  List completedTask = [
    {'Head':'Complted task Test',
      'subtitle':'subtitle test here',
      'date':'21/8/23',}
  ];
  List getAllTask() {
    return allTask;
  }

  removeTask(BuildContext context, index) {
    allTask.removeAt(index);
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
    completedTask.add(completed);
  }
}
