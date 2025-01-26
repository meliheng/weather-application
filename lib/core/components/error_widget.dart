import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;
  final String? buttonText;
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onPressed,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          if (onPressed != null)
            TextButton(onPressed: onPressed, child: Text(buttonText ?? "")),
        ],
      ),
    );
  }
}
