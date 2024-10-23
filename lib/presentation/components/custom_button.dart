import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.borderColor,
    this.width,
    required this.borderRadius,
    required this.onTap,
    required this.fontSize,
    this.icon,
  });

  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final double? width;
  final double borderRadius;
  final double fontSize;
  final VoidCallback onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = width ?? MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null) const SizedBox(width: 6),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontFamily: 'SourceSans3',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
