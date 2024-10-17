import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/rank_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/screens/leaderboard_screen.dart';

import '../controller/user_bloc.dart';
import '../screens/home_screen.dart';
import '../screens/pricing_screen.dart';
import '../screens/user_history_screen.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

  const NavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xffFF904D),
      unselectedItemColor: const Color(0xff094546),
      onTap: (index) {
        if (index == currentIndex) return;
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 1:
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 140),
                transitionsBuilder:
                    (context, firstAnimation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(firstAnimation),
                    child: child,
                  );
                },
                pageBuilder: (context, firstAnimation, secondaryAnimation) =>
                    MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<UserRankBloc>(context),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<UserBloc>(context),
                  )
                ], child: const LeaderboardScreen()),
              ),
            );
            break;
          case 2:
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 140),
                transitionsBuilder:
                    (context, firstAnimation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(firstAnimation),
                    child: child,
                  );
                },
                pageBuilder: (context, firstAnimation, secondaryAnimation) =>
                    MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<PaymentBloc>(context),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<UserBloc>(context),
                  )
                ], child: const PricingScreen()),
              ),
            );
            break;
          case 3:
            BlocProvider.of<LogBloc>(context).add(FetchLogEvent());
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 140),
                transitionsBuilder:
                    (context, firstAnimation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(firstAnimation),
                    child: child,
                  );
                },
                pageBuilder: (context, firstAnimation, secondaryAnimation) =>
                    MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<LogBloc>(context),
                  ),
                ], child: const UserHistoryScreen()),
              ),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Rank',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Pricing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
      ],
    );
  }
}
