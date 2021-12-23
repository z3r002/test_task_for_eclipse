import 'package:flutter/material.dart';
import 'package:task_for_eclipse/config/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    required this.onClick,
    this.outline = false,
    this.height = 60,
  });

  final String text;
  final VoidCallback onClick;
  final bool outline;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: outline ? whiteColor : grayColor,
            border: outline ? Border.all(color: grayColor, width: 2) : null,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        height: height,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Text(text,
            style: TextStyle(
                color: outline ? grayColor : whiteColor, fontSize: 18)),
      ),
    );
  }
}
