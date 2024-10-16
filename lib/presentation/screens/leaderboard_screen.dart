import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/main_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/nav_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/shimmers.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/notification_screen.dart';

import '../../domain/entities/user_rank.dart';
import '../components/member_card.dart';
import '../components/top_member_card.dart';
import '../controller/rank_bloc.dart';
import '../controller/rank_event.dart';
import '../controller/rank_state.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserRankBloc>(context).add(GetUserRankEvent());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => MainAppBar(
            rightIcon: Icons.notifications_none,
            onNotificationPressed: () {
              Navigator.push(
                context,
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
                      const NotificationScreen(),
                ),
              );
            },
            image: state.welcomeData.imageUrl,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: BlocBuilder<UserRankBloc, UserRankState>(
          builder: (context, state) {
            switch (state.userRankingsRequestState) {
              case RequestState.loading:
                return _buildLoadingState();
              case RequestState.loaded:
                final userRankings = state.userRankings;
                return _buildLeaderboard(userRankings);
              case RequestState.error:
                return Center(
                  child: Text(state.userRankingsErrorMessage),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        TextShimmer(),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopMemberCardShimmer(),
            TopMemberCardShimmer(),
            TopMemberCardShimmer(),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const MemberCardShimmer();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboard(List<UserRank> userRankings) {
    return Column(
      children: [
        const Text(
          'Ranking',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopMemberCard(
              rank: 2,
              name: userRankings[2].name,
              college: userRankings[2].college,
              points: userRankings[2].points,
              image: userRankings[2].imageUrl,
              rankImage: 'assets/rank_three.png',
            ),
            TopMemberCard(
              rank: 1,
              name: userRankings[0].name,
              college: userRankings[0].college,
              points: userRankings[0].points,
              image: userRankings[0].imageUrl,
              rankImage: 'assets/rank_one.png',
            ),
            TopMemberCard(
              rank: 3,
              name: userRankings[1].name,
              college: userRankings[1].college,
              points: userRankings[1].points,
              image: userRankings[1].imageUrl,
              rankImage: 'assets/rank_two.png',
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: userRankings.length - 3,
            itemBuilder: (context, index) {
              final rank = index + 4;
              final userRanking = userRankings[index + 3];
              return MemberCard(
                rank: rank,
                name: userRanking.name,
                college: userRanking.college,
                points: userRanking.points,
                image: userRanking.imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}
