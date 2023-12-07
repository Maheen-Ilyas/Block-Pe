import 'package:flutter/material.dart';

class B extends StatelessWidget {
  const B({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("B"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
      ),
    );
  }
}
