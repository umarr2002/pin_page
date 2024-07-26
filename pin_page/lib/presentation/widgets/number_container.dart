import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberContainer extends StatelessWidget {
  NumberContainer({
    super.key,
    this.index,
    this.icon,
    this.color,
    required this.onTap,
  });
  final String? index;
  final Icon? icon;
  final Color? color;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 78,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.white,
        ),
        child: icon ??
            Text(
              index ?? '',
              style: const TextStyle(
                fontSize: 29,
                color: Color(0xff070707),
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
