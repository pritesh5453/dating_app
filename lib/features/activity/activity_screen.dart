import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        title: const Text('Activity'),
        elevation: 0,
        backgroundColor: const Color(0xFFF7F8FC),
      ),
      body: const Center(
        child: Text('Activity screen '),
      ),
    );
  }
}
