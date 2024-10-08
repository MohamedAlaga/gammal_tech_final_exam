import 'package:flutter/material.dart';

class CardInfoHomePage extends StatelessWidget {
  final String name;
  final int solvedExams;
  final int rank;
  final int points;

  CardInfoHomePage({
    required this.name,
    required this.solvedExams,
    required this.rank,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good\nEvening,\n$name',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff094546),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Let's Exam!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/img_4.png',
                  width: 150,
                  height: 115,
                )
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '$solvedExams',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff094546),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Solved exams',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff008080),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$rank',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff094546),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Out of 2000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff008080),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$points',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff094546),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Points',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff008080),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
