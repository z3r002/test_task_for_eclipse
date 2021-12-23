import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 17,
      this.fontWeight = FontWeight.normal,
      this.tapText,
      this.textAlign = TextAlign.left,
      this.fontStyle = FontStyle.normal,
      this.maxLines = 1})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final VoidCallback? tapText;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: tapText,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontStyle: fontStyle),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ));
  }
}
