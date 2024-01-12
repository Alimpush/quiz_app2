import 'package:flutter/material.dart';

class RezulButton extends StatelessWidget {
  const RezulButton({super.key, required this.tuuraIconbu});

  final bool tuuraIconbu;

  @override
  Widget build(BuildContext context) {
    return Icon(tuuraIconbu ? Icons.check : Icons.close,
        color: tuuraIconbu ? Colors.green : Colors.red);
  }
}
