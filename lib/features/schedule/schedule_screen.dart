import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
const ScheduleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Schedule Screen'),
      ),
    );
  }
}