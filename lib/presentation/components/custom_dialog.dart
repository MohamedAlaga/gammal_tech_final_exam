import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.onTap,
    this.title = "Enter exam",
    this.content = "are you ready to enter exam ?",
  });
  final void Function()? onTap;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: const Color(0xFFFF904D))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SourceSansText(
                  text: title, fontsize: 22, fontWeight: FontWeight.w600 ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SourceSansText(
                    text: content, fontsize: 16, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xFFE75757)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SourceSansText(
                              text: "no",
                              fontsize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    )),
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
                          child: Align(
                            alignment: Alignment.center,
                            child: SourceSansText(
                                text: "yes",
                                fontsize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFFFF)),
                          ),
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