import 'package:flutter/material.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';

class CustomSnackbar {
  static SnackBar build(BuildContext context, String message) {
    return SnackBar(
      content: Text(message, style: context.textTheme.labelSmall),
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
    );
  }
}
