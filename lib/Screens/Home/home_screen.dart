import 'package:flutter/material.dart';
import 'package:practise_app_3/Services/Task_services.dart';
import 'package:practise_app_3/Widgets/addTask.dart';
import 'package:practise_app_3/Widgets/taskLikst.dart';

import '../../Config/constant.dart';
class homescreen extends StatefulWidget {
  static taskServices taskservice = taskServices();
  homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("To-Do List",style: Theme.of(context).textTheme.labelMedium,),
                  ],
                ),
                taskList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed:(){
          showDialog(context: context,
              builder:(BuildContext context){
            return addTask();
              }
          );
      },
      child: Icon(Icons.add,color: Colors.black),
    ),
      backgroundColor: Constant.backGroundColor,
    );
  }
}
