import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

class CardInfoHomePage extends StatelessWidget {
  const CardInfoHomePage({
    super.key,
    required this.name,
    required this.solvedExams,
    required this.rank,
    required this.outOf,
    required this.points,
  });

  final String name;
  final int rank;
  final int outOf;
  final int solvedExams;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good\nEvening,\n$name',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff094546),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Let's Exam!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/info.png',
                    width: 150,
                    height: 115,
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SourceSansText(
                        text: solvedExams.toString(),
                        fontsize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      const SourceSansText(
                          text: 'Solved exams',
                          fontWeight: FontWeight.w600,
                          fontsize: 16,
                          color: Color(0xff008080)),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 48,
                    color: Color(0xFFD3D3D3),
                  ),
                  Column(
                    children: [
                      SourceSansText(
                        text: rank.toString(),
                        fontsize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SourceSansText(
                          text: 'Out of $outOf',
                          fontWeight: FontWeight.w600,
                          fontsize: 16,
                          color: const Color(0xff008080)),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 48,
                    color: Color(0xFFD3D3D3),
                  ),
                  Column(children: [
                    SourceSansText(
                      text: points.toString(),
                      fontsize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    const SourceSansText(
                        text: 'Points',
                        fontWeight: FontWeight.w600,
                        fontsize: 16,
                        color: Color(0xff008080)),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
