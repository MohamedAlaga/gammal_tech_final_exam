import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/service_locator.dart';
import 'package:gammal_tech_final_exam/domain/usecase/check_user_attempts_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/accept_custom_dialoge.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MoreDataScreen extends StatelessWidget {
  const MoreDataScreen(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.neededSkills,
      required this.points,
      required this.quizId,
      required this.duration});
  final String imageUrl;
  final String description;
  final String neededSkills;
  final String points;
  final String quizId;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SubAppBar(
        appBarColor: Colors.white,
        iconsColor: Color(0xff094546),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image(
                  image: NetworkImage(imageUrl),
                  width: 216,
                  height: 216,
                  fit: BoxFit.cover,
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: SourceSansText(
                      text: "Quiz description",
                      fontsize: 22.0,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SourceSansText(
                        fontsize: 16.0,
                        fontWeight: FontWeight.w500,
                        text: description)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SourceSansText(
                        text: "Needed skills",
                        fontsize: 22.0,
                        fontWeight: FontWeight.w600)),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: SourceSansText(
                      fontsize: 16.0,
                      fontWeight: FontWeight.w500,
                      text: neededSkills)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SourceSansText(
                        text: "Points : $points pts",
                        fontsize: 22.0,
                        fontWeight: FontWeight.w600)),
              ),
              CustomButton(
                  text: "Start Quiz",
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  borderRadius: 8,
                  onTap: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        return const Center(
                          child: SizedBox(
                            height: 36,
                            width: 36,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                    var result = await sl<CheckUserAttemptsUsecase>().execute();
                    Navigator.of(context, rootNavigator: true).pop();
                    result.fold(
                      (failure) {
                        showRedToast(
                            "Error occured while checking attempts remaning");
                      },
                      (hasAttemptsLeft) {
                        if (hasAttemptsLeft) {
                          BlocProvider.of<ExamsBloc>(context)
                              .add(FetchQuestionsEvent(quizId, duration));
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: QuizPage(),
                            withNavBar: false,
                          );
                        } else {
                          showGeneralDialog(
                            context: context,
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            barrierDismissible: true,
                            barrierLabel: '',
                            transitionBuilder: (context, a1, a2, widget) {
                              final curvedValue =
                                  Curves.easeInOutBack.transform(a1.value) -
                                      1.0;
                              return Transform(
                                transform: Matrix4.translationValues(
                                    0.0, curvedValue * 200, 0.0),
                                child: Opacity(
                                  opacity: a1.value,
                                  child: AcceptCustomDialoge(
                                    onTap: () {
                                      Navigator.pop(
                                          context); // Close the custom dialog
                                    },
                                    body: "You do not have any attempts left",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                            pageBuilder: (context, animation1, animation2) {
                              return const SizedBox();
                            },
                          );
                        }
                      },
                    );
                  },
                  fontSize: 22)
            ],
          ),
        ),
      ),
    );
  }
}
