import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/fira_code_text.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

class AcceptCustomDialoge extends StatelessWidget {
  const AcceptCustomDialoge({
    super.key,
    required this.onTap,
    this.title = "Enter exam",
    this.body = "",
    this.textAlign = TextAlign.center,
  });
  final void Function()? onTap;
  final String title;
  final String body;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFF904D)),
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SourceSansText(
                  text: title, fontsize: 22, fontWeight: FontWeight.w600),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, right: 24, left: 24),
                child: SourceSansText(
                    text: body,
                    fontsize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: textAlign),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, right: 24, left: 24),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFF094546),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: FiraCodeText(
                              text: "yes",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffDCF1F1)),
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
