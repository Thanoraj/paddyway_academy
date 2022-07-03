import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  const MyFlatButton({
    Key? key,
    required this.child,
    this.color = const Color(0xff6c609c),
    required this.onTap,
    this.radius,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final Function onTap;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 12), color: color),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: child,
      ),
    );
  }
}
