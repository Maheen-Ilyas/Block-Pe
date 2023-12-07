import 'package:flutter/material.dart';

class C extends StatelessWidget {
  const C({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
      ),
    );
  }
}
