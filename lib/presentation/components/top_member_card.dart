import 'package:flutter/material.dart';

class TopMemberCard extends StatelessWidget {
  const TopMemberCard({
    super.key,
    required this.rank,
    required this.state,
    required this.points,
    required this.rankImage,
    required this.fName,
    required this.sName,
  });

  final int rank;
  final String rankImage;
  final String fName;
  final String sName;
  final String state;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFFfffff),
          backgroundImage: AssetImage(rankImage),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          fName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: rank == 1 ? 18 : 14,
          ),
        ),
        sName != ''
            ? Text(
                sName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: rank == 1 ? 18 : 14,
                ),
              )
            : const SizedBox(),
        Text(
          state,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: rank == 1 ? 16 : 12,
          ),
        ),
        Text(
          '$points',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: rank == 1 ? 18 : 14,
          ),
        ),
        SizedBox(height: rank == 1 ? 24 : 0),
      ],
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    try {
      if (imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      } else {
        return const AssetImage('assets/user_photo.png');
      }
    } catch (e) {
      return const AssetImage('assets/user_photo.png');
    }
  }
}
