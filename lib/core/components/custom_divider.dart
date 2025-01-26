import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      height: 20,
      thickness: 0.5,
      indent: 0,
      endIndent: 0,
    );
  }
}
