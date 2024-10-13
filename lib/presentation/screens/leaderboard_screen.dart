import 'package:flutter/material.dart';

import '../components/member_card.dart';
import '../components/temp_sub_app_bar.dart';
import '../components/top_member_card.dart';

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
  [6, 'Omer', 'college name', 100],
  [7, 'Mohamed', 'college name', 100],
  [8, 'Ali', 'college name', 100],
  [9, 'Omer', 'college name', 100],
  [10, 'Mohamed', 'college name', 100],
  [11, 'Ali', 'college name', 100],
  [12, 'Omer', 'college name', 100],
  [13, 'Mohamed', 'college name', 100],
  [14, 'Ali', 'college name', 100],
  [15, 'Omer', 'college name', 100],
];

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff094546),
      appBar: TempSubAppBar(
        rightIcon: Icons.notifications_none,
        onRightIconPressed: () {},
        appBarColor: Color(0xff094546),
        iconsColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            color: Color(0xff094546),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 3
                TopMemberCard(
                  rank: userRank[2][0],
                  name: userRank[2][1],
                  college: userRank[2][2],
                  points: userRank[2][3],
                  image: userRank[2][4],
                  rankImage: 'assets/rank_three.png',
                ),
                // 1
                TopMemberCard(
                  rank: userRank[0][0],
                  name: userRank[0][1],
                  college: userRank[0][2],
                  points: userRank[0][3],
                  image: userRank[0][4],
                  rankImage: 'assets/rank_one.png',
                ),
                // 2
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
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16),
                itemCount: 17,
                itemBuilder: (context, index) {
                  return MemberCard(
                    rank: index + 4,
                    name: 'Name member',
                    college: 'name college',
                    points: (20 - index) * 10,
                    image:
                        'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
