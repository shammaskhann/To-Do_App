import 'package:flutter/material.dart';
import 'package:practise_app_3/Screens/Home/home_screen.dart';
import 'package:practise_app_3/Widgets/toastMessage.dart';
class editTask extends StatelessWidget {
  int index;
  editTask({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var taskHeadingController = TextEditingController();
    var taskDescriptionController = TextEditingController();
    taskHeadingController.text=homescreen.taskservice.allTask[index]['Head'];
    taskDescriptionController.text=homescreen.taskservice.allTask[index]['subtitle'];
    return AlertDialog(
      title: Center(
          child: Text(
            'EDIT TASK',
            style: Theme
                .of(context)
                .textTheme
                .titleSmall,
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Task Name',
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 15,
                fontFamily: 'Nike'),
          ),
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
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          const Text(
            'Enter Task Description',
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 15,
                fontFamily: 'Nike'),
          ),
          TextField(
            controller: taskDescriptionController,
            decoration: const InputDecoration(
              hintText:
              "Task Description Here..", //prefixIcon: Icon(Icons.edit_document)
              suffixIcon: Icon(Icons.edit_document),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                homescreen.taskservice.allTask[index]['Head']=taskHeadingController.text;
                homescreen.taskservice.allTask[index]['subtitle']=taskDescriptionController.text;
                print("allTask: ${homescreen.taskservice.allTask}");
                toastmessage().toastMessage("TASK SUCCESSFULLY EDITED");
                Navigator.push(context,MaterialPageRoute(builder:(context)=> homescreen()));
              },
              child: const Center(
                  child: Text('SAVE CHANGES',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))))
        ],
      ),
    );
  }
}
