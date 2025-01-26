import 'package:flutter/material.dart';

class CircularCard extends StatelessWidget {
  final Widget child;
  const CircularCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: child,
    );
  }
}
