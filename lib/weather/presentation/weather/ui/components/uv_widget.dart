import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/global_constants.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';

class UvWidget extends StatelessWidget {
  final double uvIndex;
  const UvWidget({super.key, required this.uvIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: GlobalConstants.isDayTime ? Colors.green : Colors.orange,
      ),
      child: Text(
        uvIndex.toInt().toString(),
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
