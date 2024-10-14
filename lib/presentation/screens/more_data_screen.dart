import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';

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
      appBar: SubAppBar(
        rightIcon: Icons.notifications_outlined,
        appBarColor: Colors.white,
        iconsColor: Color(0xff094546),
        onRightIconPressed: () {},
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
                  onTap: () {
                    BlocProvider.of<ExamsBloc>(context)
                        .add(FetchQuestionsEvent(quizId, duration));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(providers: [
                          BlocProvider.value(
                              value: BlocProvider.of<ExamsBloc>(context)),
                          BlocProvider.value(
                            value: BlocProvider.of<TopicsBloc>(context),
                          )
                        ], child: QuizPage()),
                      ),
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
