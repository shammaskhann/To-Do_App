import 'package:flutter/material.dart';
import 'package:practise_app_3/Screens/Home/home_screen.dart';
import 'package:practise_app_3/Widgets/toastMessage.dart';
class addTask extends StatelessWidget {
  const addTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskHeadingController = TextEditingController();
    final taskDescriptionController = TextEditingController();
    return AlertDialog(
      title: Center(
          child: Text(
            'NEW TASK',
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
                Map info = {
                  'Head': taskHeadingController.text,
                  'subtitle':
                  taskDescriptionController.text,
                };
                homescreen.taskservice.allTask.add(info);
                print("allTask: ${homescreen.taskservice.allTask}");
                toastmessage().toastMessage("TASK SUCESSFULLY ADDED");
                Navigator.push(context,MaterialPageRoute(builder:(context)=> homescreen()));
              },
              child: const Center(
                  child: Text('ADD TASK',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))))
        ],
      ),
    );
  }
}
