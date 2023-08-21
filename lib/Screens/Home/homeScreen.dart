import 'package:flutter/material.dart';
import 'package:practise_app_3/Services/Task_services.dart';

import '../../Config/constant.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  static taskServices taskservices = taskServices();
  taskServices getTaskService() {
    return taskservices;
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    var taskSize =taskservices.allTask.length;
    final taskHeadingController = TextEditingController();
    final taskDescriptionController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 25),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TOP HEADER LIKE APPBAR CONTAIN BACK-BUTTON AND HEADING
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("To-Do List",
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              //Spacing
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('UPCOMING',
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                      (taskservices.allTask.length > 0)
                          ? Container(
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height*0.12*taskservices.allTask.length,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: taskservices.allTask.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10,top:5),
                              child: Container(
                                height: 75,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  // contentPadding: EdgeInsets.all(5),
                                    leading: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${index + 1}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                    title: Text(
                                        taskservices.allTask[index]['Head'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    subtitle: Text(
                                        taskservices.allTask[index]['subtitle'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    trailing: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      // alignment: WrapAlignment.spaceEvenly,
                                      // runAlignment: WrapAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: const Icon(Icons.edit)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              taskservices.removeTask(
                                                  context, index);
                                              setState(() {});
                                            },
                                            child: const Icon(Icons.delete)),
                                        // const SizedBox(
                                        //   width: 5,
                                        // ),
                                        //dropDown(context, index),
                                        //taskservices.onTapTaskFunc(context, index),
                                        PopupMenuButton(
                                            onSelected: (value){
                                              print(value);
                                              if(value=='Imp'){
                                                taskservices.importantTask.add(taskservices.allTask[index]);
                                                print('important task updated : $taskservices.importantTask');
                                                setState(() {

                                                });
                                              }
                                              else{
                                                taskservices.completeTask(index);
                                                print('complete task updated: $taskservices.completedTask');
                                                setState(() {

                                                });
                                              }
                                            },
                                            itemBuilder:(BuildContext context){
                                              return [
                                                const PopupMenuItem(
                                                  value: 'Imp',
                                                  child: Center(
                                                    child: Wrap(
                                                        children:[
                                                          Text("Mark as Important"),
                                                          Icon(Icons.star),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const PopupMenuItem(
                                                  value: 'Mark as Completed',
                                                  child: Center(
                                                    child: Wrap(
                                                      children: [
                                                        Text("Mark as Completed"),
                                                        Icon(Icons.check),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ];
                                            }
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      )
                          : Center(child: Text('No Task Available',style: Theme.of(context).textTheme.labelSmall,)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('FINISHED',
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                      (taskservices.completedTask.length > 0 ) ? Container(
                        height: MediaQuery.of(context).size.height*0.107*taskservices.completedTask.length,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: taskservices.completedTask.length,
                            itemBuilder: (BuildContext context,index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: Container(
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: Constant.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    title : Text(taskservices.completedTask[index]['Head'],style:const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Nike',decoration: TextDecoration.lineThrough)),
                                    subtitle : Text(taskservices.completedTask[index]['subtitle'],style:const TextStyle(color: Colors.black, fontWeight: FontWeight.normal , fontSize: 15 , fontFamily: 'Nike',decoration: TextDecoration.lineThrough)),
                                    trailing: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            taskservices.removeCompleteTask(index);
                                            setState(() {

                                            });
                                          },
                                            child: const Icon(Icons.delete)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(taskservices.completedTask[index]['date']),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ) : Center(child: Text("NO TASK FINISHED",style:Theme.of(context).textTheme.labelSmall)),
                    ],
                  ),
                ),
              ),
            ],
            //
          ),
          // ADD TASK FLOATING BUTTON
          Positioned(
              right: 1,
              bottom: 90,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                              child: Text(
                            'ADD NEW TASK',
                            style: Theme.of(context).textTheme.titleSmall,
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
                                width: MediaQuery.of(context).size.width,
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
                                    taskservices.allTask.add(info);
                                    print("allTask: ${taskservices.allTask}");
                                    Navigator.pop(context);
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
                      },
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 1.5,
                          color: Colors.black.withOpacity(0.6),
                          blurStyle: BlurStyle.inner,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text('ADD TASK',
                            style: TextStyle(color: Colors.black, fontSize: 15))
                      ],
                    ),
                  ))),
        ]),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }

  }
