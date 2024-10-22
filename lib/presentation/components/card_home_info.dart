import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final int number;
  final String text;
  final Color circleBorderColor;

  const InfoCard({
    super.key,
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
        width: MediaQuery.of(context).size.width * 0.24,
        height: MediaQuery.of(context).size.width * 0.24,
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
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$number',
                    style: TextStyle(fontSize: number > 100 ? 16 : 24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style:
                    TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
