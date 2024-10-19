import 'package:flutter/material.dart';

import 'custom_button.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.borderColor,
    required this.cardColor,
    required this.textColor,
    required this.buttonText,
    required this.onTap,
  });

  final String title;
  final String price;
  final List<String> features;
  final Color borderColor;
  final Color cardColor;
  final Color textColor;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              price,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Divider(
              color: textColor,
              thickness: 1,
            ),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        feature,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 6),
            CustomButton(
              text: 'Start',
              textColor: borderColor,
              buttonColor: cardColor,
              borderColor: borderColor,
              borderRadius: 8,
              onTap: onTap,
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
