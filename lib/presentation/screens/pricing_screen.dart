import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/main_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/nav_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/pricing_card.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history_screen.dart';

import '../controller/user_bloc.dart';
import '../controller/user_state.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => MainAppBar(
            rightIcon: Icons.notifications_none,
            onNotificationPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserHistoryScreen(),
                ),
              );
            },
            image: state.welcomeData.imageUrl,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Center(
            child: Column(
              children: [
                PricingCard(
                  title: 'Basic',
                  price: '100EP',
                  features: ['15 Attemps', '15 Attemps'],
                  cardColor: Colors.white,
                  textColor: Color(0xff094546),
                  borderColor: Color(0xffFF904D),
                  buttonText: 'Start',
                  onTap: () {},
                ),
                PricingCard(
                  title: 'Basic',
                  price: '100EP',
                  features: ['15 Attemps', '15 Attemps'],
                  cardColor: Colors.white,
                  textColor: Color(0xff094546),
                  borderColor: Color(0xffFF904D),
                  buttonText: 'Start',
                  onTap: () {},
                ),
                PricingCard(
                  title: 'Basic',
                  price: '100EP',
                  features: ['15 Attemps', '15 Attemps'],
                  cardColor: Colors.white,
                  textColor: Color(0xff094546),
                  borderColor: Color(0xffFF904D),
                  buttonText: 'Start',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
