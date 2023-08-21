import 'package:flutter/cupertino.dart';
import 'package:practise_app_3/Services/Task_services.dart';

class ListTileView extends StatefulWidget {
  late taskServices taskservices;
  ListTileView({Key? key,required this.taskservices}): super(key: key);

  @override
  State<ListTileView> createState() => _ListTileViewState();
}

class _ListTileViewState extends State<ListTileView> {
  //final taskServices taskservices;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
