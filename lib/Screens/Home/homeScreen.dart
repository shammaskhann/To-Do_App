import 'package:flutter/material.dart';
import 'package:practise_app_3/Services/Task_services.dart';

import '../../Config/constant.dart';
class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    taskServices taskservices = taskServices();
    final itemSearchController = TextEditingController();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left:18.0,right:18.0,top:25),
          child: Stack(
            children: [
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TOP HEADER LIKE APPBAR CONTAIN BACK-BUTTON AND HEADING
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
                  Text("To-Do List",style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(
                      width: 1,
                    )
                  ],
                ),
                //Spacing
                const SizedBox(
                  height: 20,
                ),
                //Search Bar
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child:  Center(
                    child: TextFormField(
                      onTap: (){

                      },
                      controller: itemSearchController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search..',
                          focusColor: Colors.transparent,
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02 ,
                ),
                Text('TASK', style: Theme.of(context).textTheme.labelLarge),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            // contentPadding: EdgeInsets.all(5),
                            leading: Text('${index+1}',style: Theme.of(context).textTheme.titleSmall),
                            title: Text('Heading 1', style: Theme.of(context).textTheme.headlineSmall),
                            subtitle: Text('subtitle',style: Theme.of(context).textTheme.titleSmall),
                            trailing: const Wrap(
                              children: [
                                InkWell(
                                  child: Icon(Icons.edit)

                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    child: Icon(Icons.delete)
                                )
                              ],
                            )
                          ),
                        ),
                      );
                  },
                  ),
                ),
              ],
              //
            ),
              Positioned(
                right: 1,
                bottom: 90,
                child: InkWell(
                    onTap:(){
                      taskservices.addTask(context);
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
                          Text('ADD TASK', style:TextStyle(color: Colors.black,fontSize: 15))
                        ],
                      ),
                    )
                  )
                ),
        ]
          ),
        ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
