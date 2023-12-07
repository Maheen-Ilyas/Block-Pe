import 'package:flutter/material.dart';

class A extends StatelessWidget {
  const A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
      ),
    );
  }
}
