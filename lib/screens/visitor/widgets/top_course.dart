import 'package:flutter/material.dart';

class TopCourseScreen extends StatelessWidget {
  const TopCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top courses'),
      ),
      body: const Center(
        child: Text('Top courses'),
      ),
    );
  }
}
