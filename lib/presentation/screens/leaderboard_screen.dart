import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/nav_bar.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history_screen.dart';

import '../components/main_app_bar.dart';
import '../components/member_card.dart';
import '../components/top_member_card.dart';
import '../controller/user_bloc.dart';
import '../controller/user_state.dart';

List<List<dynamic>> userRank = [
  [
    1,
    'Mohamed',
    'college name',
    2000,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    2,
    'Ali',
    'college name',
    1000,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    3,
    'Omer',
    'college name',
    500,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    4,
    'Mohamed',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    5,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    6,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    7,
    'Mohamed',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    8,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    9,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    10,
    'Mohamed',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    11,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    12,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    13,
    'Mohamed',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    14,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    15,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    16,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    17,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    17,
    'Mohamed',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    18,
    'Ali',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    19,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
  [
    20,
    'Omer',
    'college name',
    100,
    'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  ],
];

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
      body: Column(
        children: [
          const Text(
            'Rankings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color(0xffffffff),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 3rd rank
                TopMemberCard(
                  rank: userRank[2][0],
                  name: userRank[2][1],
                  college: userRank[2][2],
                  points: userRank[2][3],
                  image: userRank[2][4],
                  rankImage: 'assets/rank_three.png',
                ),
                // 1st rank
                TopMemberCard(
                  rank: userRank[0][0],
                  name: userRank[0][1],
                  college: userRank[0][2],
                  points: userRank[0][3],
                  image: userRank[0][4],
                  rankImage: 'assets/rank_one.png',
                ),
                // 2nd rank
                TopMemberCard(
                  rank: userRank[1][0],
                  name: userRank[1][1],
                  college: userRank[1][2],
                  points: userRank[1][3],
                  image: userRank[1][4],
                  rankImage: 'assets/rank_two.png',
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 3; i < userRank.length; i++)
                      MemberCard(
                        rank: i + 1,
                        name: userRank[i][1],
                        college: userRank[i][2],
                        points: userRank[i][3],
                        image: userRank[i][4],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
