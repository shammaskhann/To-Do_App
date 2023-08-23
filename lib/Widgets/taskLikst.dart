import 'package:flutter/material.dart';
import 'package:practise_app_3/Screens/Home/home_screen.dart';
import 'package:practise_app_3/Widgets/editDailog.dart';

import '../Config/constant.dart';
class taskList extends StatefulWidget {
  const taskList({super.key});

  @override
  State<taskList> createState() => _taskListState();
}

class _taskListState extends State<taskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('UPCOMING',style: Theme.of(context).textTheme.labelSmall,)
          ],
        ),
        (homescreen.taskservice.allTask.isNotEmpty) ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homescreen.taskservice.allTask.length,
            itemBuilder:(BuildContext context,index){
          return Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Constant.primaryColor,
              borderRadius: BorderRadius.circular(15),
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
                    homescreen.taskservice.allTask[index]['Head'],
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall),
                subtitle: Text(
                    homescreen.taskservice.allTask[index]['subtitle'],
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
                        onTap: ()
                        {
                          showDialog(
                              context: context,
                              builder:(BuildContext context){
                                return editTask(index: index);
                          });
                          setState(() {
                          });
                        },
                        child: const Icon(Icons.edit)),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          homescreen.taskservice.removeTask(
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
                            homescreen.taskservice.importantTask.add(homescreen.taskservice.allTask[index]);
                            print('important task updated : $homescreen.taskservice.importantTask');
                            setState(() {
                            });
                          }
                          else{
                            homescreen.taskservice.completeTask(index);
                            print('complete task updated: $homescreen.taskservices.completedTask');
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
          );
        }) : Text('NO UPCOMING TASK AVAILABLE', style: Theme.of(context).textTheme.labelSmall,),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('FINISHED',style: Theme.of(context).textTheme.labelSmall,)
          ],
        ),
        (homescreen.taskservice.completedTask.isNotEmpty) ? ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homescreen.taskservice.completedTask.length,
            itemBuilder:(BuildContext context, index){
              return Container(
                margin: const EdgeInsets.only(top:15),
                decoration: BoxDecoration(
                  color: Constant.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title : Text(homescreen.taskservice.completedTask[index]['Head'],style:const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Nike',decoration: TextDecoration.lineThrough)),
                  subtitle : Text(homescreen.taskservice.completedTask[index]['subtitle'],style:const TextStyle(color: Colors.black, fontWeight: FontWeight.normal , fontSize: 15 , fontFamily: 'Nike',decoration: TextDecoration.lineThrough)),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap:(){
                            homescreen.taskservice.removeCompleteTask(index);
                            setState(() {
                            });
                          },
                          child: const Icon(Icons.delete)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(homescreen.taskservice.completedTask[index]['date']),
                    ],
                  ),
                ),
              );
            },
        ): Text('NO FININSHED TASK AVAILABLE', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
