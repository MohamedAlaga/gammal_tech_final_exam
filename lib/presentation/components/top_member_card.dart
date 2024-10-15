import 'package:flutter/material.dart';

class TopMemberCard extends StatelessWidget {
  const TopMemberCard({
    Key? key,
    required this.rank,
    required this.name,
    required this.college,
    required this.points,
    required this.rankImage,
    required this.image,
  }) : super(key: key);

  final int rank;
  final String rankImage;
  final String image;
  final String name;
  final String college;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: rank == 1 ? 36 : 32,
              backgroundImage: _getImageProvider(image),
              backgroundColor: Colors.grey,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: const Color(0xFFFfffff),
                backgroundImage: AssetImage(rankImage),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: rank == 1 ? 18 : 14,
          ),
        ),
        Text(
          college,
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
        SizedBox(height: rank == 1 ? 24 : (rank == 2 ? 12 : 0)),
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
