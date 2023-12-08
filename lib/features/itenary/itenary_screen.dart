import 'package:flutter/material.dart';

class ItenaryScreen extends StatelessWidget {
const ItenaryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Itenary Screen'),
      ),
    );
  }
}