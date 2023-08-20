import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class taskServices {
List allTask = [];
List completedTask = [];
final taskHeadingController = TextEditingController();
final taskDescriptionController = TextEditingController();
 addTask(BuildContext context){
   showDialog(
     barrierDismissible: true,
       context: context,
       builder:(BuildContext context){
         return AlertDialog(
           title: Center(child: Text('ADD NEW TASK',style: Theme.of(context).textTheme.titleSmall,)),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const Text('Enter Task Name',style: TextStyle(color: Colors.amberAccent, fontSize: 15, fontFamily: 'Nike'),),
               TextField(
                 controller: taskHeadingController,
                 decoration: const InputDecoration(
                   hintText: "Task Heading Here..",
                   //prefixIcon: Icon(Icons.edit_document)
                   suffixIcon: Icon(Icons.edit_document),
                 ),
               ),
               SizedBox(
                 height: 10,
                 width: MediaQuery.of(context).size.width,
               ),
               const Text('Enter Task Description',style: TextStyle(color: Colors.amberAccent, fontSize: 15, fontFamily: 'Nike'),),
               TextField(
                 controller: taskHeadingController,
                 decoration: const InputDecoration(
                   hintText: "Task Description Here..",
                   //prefixIcon: Icon(Icons.edit_document)
                   suffixIcon: Icon(Icons.edit_document),
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               ElevatedButton(
                   onPressed:(){

               }, child: const Center(
                   child: Text('ADD TASK' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,))
                 )
               )
             ],
           ),
         );
       },
       );
 }
}