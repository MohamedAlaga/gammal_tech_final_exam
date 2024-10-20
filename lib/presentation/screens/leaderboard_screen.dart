import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/shimmers.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
      ),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        const TextShimmer(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TopMemberCard(
              rank: 2,
              fName: getFirstName(userRankings[2].name),
              sName: getSecondName(userRankings[2].name),
              state: userRankings[2].state,
              points: userRankings[2].points,
              rankImage: 'assets/rank_three.png',
            ),
            TopMemberCard(
              rank: 1,
              fName: getFirstName(userRankings[0].name),
              sName: getSecondName(userRankings[0].name),
              state: userRankings[0].state,
              points: userRankings[0].points,
              rankImage: 'assets/rank_one.png',
            ),
            TopMemberCard(
              rank: 3,
              fName: getFirstName(userRankings[1].name),
              sName: getSecondName(userRankings[1].name),
              state: userRankings[1].state,
              points: userRankings[1].points,
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
                points: userRanking.points,
                state: userRanking.state,
              );
            },
          ),
        ),
      ],
    );
  }

  String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts[0] : '';
  }

  String getSecondName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.length > 1 ? nameParts[1] : '';
  }
}
