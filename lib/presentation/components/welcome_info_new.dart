import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_home_info.dart';

class WelcomeInfoNew extends StatelessWidget {
  const WelcomeInfoNew(
      {super.key,
      required this.name,
      required this.card1,
      required this.card2Text1,
      required this.card2Text2,
      required this.card3});
  final String name;
  final int card1;
  final int card2Text1;
  final int card2Text2;
  final int card3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff094546),
      ),
      child: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.12,
          decoration:  const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Good Evening, $name !',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Let's start Exam!",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(
                    number: card1,
                    text: "Exam",
                    circleBorderColor: const Color(0xffFF904D),
                  ),
                  InfoCard(
                    number: card2Text1,
                    text: "Rank",
                    circleBorderColor: const Color(0xffFF904D),
                  ),
                  InfoCard(
                    number: card3,
                    text: "Points",
                    circleBorderColor: const Color(0xffFF904D),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
