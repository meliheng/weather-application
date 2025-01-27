import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';

class CircularCard extends StatelessWidget {
  final Widget child;
  const CircularCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIConstants.mediumSpacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UIConstants.defaultSpacing),
        border: Border.all(color: Colors.white),
      ),
      child: child,
    );
  }
}
