import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

class CustomTextDialog extends StatelessWidget {
  const CustomTextDialog(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.acceptText,
      required this.onAccept,
      this.onCancel,
      required this.cancelText});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String acceptText;
  final void Function() onAccept;
  final void Function()? onCancel;
  final String cancelText;
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
                text: title,
                fontsize: 22,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: TextField(
                  controller: controller,
                  cursorColor: const Color(0xff094546),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    border: buildBorder(const Color(0xffE3E5E8)),
                    enabledBorder: buildBorder(const Color(0xffE3E5E8)),
                    focusedBorder: buildBorder(const Color(0xff094546)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              text: "No",
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
                      onTap: onAccept,
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
                              text: "Yes",
                              fontsize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),
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

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
