import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final int number;
  final String text;
  final Color circleBorderColor;

  InfoCard({
    required this.number,
    required this.text,
    this.circleBorderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 98,
        height: 98,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: circleBorderColor, width: 2),
              ),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '$number',
                    style: TextStyle(fontSize: number > 100 ? 16 : 24),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              text,
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
