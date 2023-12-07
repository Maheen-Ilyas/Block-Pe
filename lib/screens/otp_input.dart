import 'package:flutter/material.dart';

class OTPInput extends StatefulWidget {
  final String verificationID;
  const OTPInput({
    super.key,
    required this.verificationID,
  });

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
