import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyProgramsScreen extends StatelessWidget {
  const MyProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Programs'),
      ),
      body: const Center(
        child: Text('My Programs'),
      ),
    );
  }
}
