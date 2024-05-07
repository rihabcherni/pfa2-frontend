import 'package:flutter/material.dart';

class NewCourseScreen extends StatelessWidget {
  const NewCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new courses'),
      ),
      body: const Center(
        child: Text('new courses'),
      ),
    );
  }
}
