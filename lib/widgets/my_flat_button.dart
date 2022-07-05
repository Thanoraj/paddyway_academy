import 'package:flutter/material.dart';
import 'package:paddyway_academy/theme_info.dart';

class MyFlatButton extends StatelessWidget {
  const MyFlatButton({
    Key? key,
    required this.child,
    this.color,
    required this.onTap,
    this.radius,
    this.padding,
  }) : super(key: key);
  final Widget child;
  final Color? color;
  final Function onTap;
  final double? radius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius ?? 12,
          ),
          color: color ?? ThemeInfo.customFlatButtonDefaultColor,
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
        child: child,
      ),
    );
  }
}
