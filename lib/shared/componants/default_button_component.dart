import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color? background;
  final double? width;
  final String text;
  final double radius;
  final VoidCallback function;
  const DefaultButton(
      {super.key,
      required this.text,
      this.background = Colors.deepOrange,
      this.width = double.infinity,
      required this.radius,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
