import 'package:flutter/material.dart';

class UserHistoryCard extends StatelessWidget {
  const UserHistoryCard({
    super.key,
    required this.dateTime,
    required this.title,
    required this.info,
    required this.image,
  });

  final String dateTime;
  final String title;
  final List<String> info;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Color(0xffE3E5E8),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFF904D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  dateTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSans3',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff094546),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: info.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'SourceSans3',
                              color: Color(0xff094546),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 18),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _getImageProvider(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 84,
                  height: 96,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    try {
      if (imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      } else {
        return const AssetImage('assets/course.png');
      }
    } catch (e) {
      return const AssetImage('assets/course.png');
    }
  }
}
