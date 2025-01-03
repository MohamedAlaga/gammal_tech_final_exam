import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.borderColor,
    required this.info,
    required this.information,
  });

  final Color borderColor;
  final String info;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              info,
              style: const TextStyle(
                color: Color(0xff094546),
                fontSize: 16,
                fontFamily: 'SourceSans3',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              information,
              style: const TextStyle(
                color: Color(0xff094546),
                fontSize: 16,
                fontFamily: 'SourceSans3',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}