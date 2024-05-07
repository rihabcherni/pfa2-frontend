import 'package:flutter/material.dart';

class YourCourseScreen extends StatelessWidget {
  const YourCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your courses'),
      ),
      body: const Center(
        child: Text('your courses'),
      ),
    );
  }
}
