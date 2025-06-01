import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
      ),
    );
  }
}
