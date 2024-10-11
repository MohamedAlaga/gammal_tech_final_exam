import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info_home_page.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_appbar.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';

//solve in appbar
// - left icon
// - icons color
//solve CardInfoHomePage
// - remove image url and set static image
// - ad out of 1000
// - remove the shadow
//solve CustomButton
// - change text style
// - remove the height
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeDataModel user = const WelcomeDataModel(
        title: "Mohamed",
        imageUrl: "https://i.imgur.com/YNWOUSR.png",
        solvedExams: 100,
        points: 1000,
        totalRanks: 100,
        rank: 1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: CustomAppBar(
              isProfileVisible: true,
              leftIcon: Icons.menu,
              rightIcon: Icons.notifications_outlined,
              onLeftIconPressed: () {},
              onRightIconPressed: () {})),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CardInfoHomePage(
                name: user.title,
                solvedExams: user.solvedExams,
                rank: user.rank,
                points: user.points,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CustomButton(
                    text: "Practice",
                    textColor: Colors.white,
                    buttonColor: const Color(0xFF094546),
                    borderColor: const Color(0xFF094546),
                    height: 44,
                    width: double.infinity,
                    borderRadius: 8,
                    onTap: () {}),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12),child:SourceSansText())
            ],
          ),
        ),
      ),
    );
  }
}
