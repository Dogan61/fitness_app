import 'package:flutter/material.dart';

class AuthLabel extends StatelessWidget {
  const AuthLabel({
    required this.text,
    this.color = Colors.black,
    super.key,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
