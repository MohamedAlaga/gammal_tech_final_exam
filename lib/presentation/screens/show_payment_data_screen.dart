import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/quiz_question_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

class ShowPaymentDataScreen extends StatelessWidget {
  const ShowPaymentDataScreen(
      {super.key,
      required this.name,
      required this.refNumber,
      required this.price});
  final String name;
  final String refNumber;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/payment.png'),
              width: double.infinity,
            ),
            const SizedBox(height: 24),
            const SourceSansText(
                text: "Payment info", fontsize: 32, fontWeight: FontWeight.w700),
            const SizedBox(height: 12),
            SourceSansText(
                text: "User Name : $name",
                fontsize: 20,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 12),
            SourceSansText(
                text: "Fawry code : $refNumber",
                fontsize: 20,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 12),
            SourceSansText(
                text: "price : $price EGP",
                fontsize: 20,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 24),
            const SourceSansText(
                text: "Plaese use fawry code to confirm your payment using fawry pay",
                fontsize: 20,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 24),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const QuizAnswerCard(content: "Back Home",textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
