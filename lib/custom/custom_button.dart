import 'package:flutter/material.dart';

class EvaluationActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;

  const EvaluationActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
     );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(text),
        style: style,
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
      );
    }
  }
}
