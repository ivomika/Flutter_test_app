import 'package:flutter/cupertino.dart';
import 'package:test_app/widgets/app_large_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final IconData? icon;
  final String? text;

  const AppButtons(
      {Key? key,
      this.icon,
      this.text,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIcon = icon != null;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: Center(
        child: isIcon?
        Icon(
          icon!,
          color: color,
        ) :
        AppLargeText(
          text: text!,
          color: color,
          size: 16,
        ),
      ),
    );
  }
}
