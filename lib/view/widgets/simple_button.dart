import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const SimpleButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, icon: Icon(icon, color: Colors.white));
  }
}
