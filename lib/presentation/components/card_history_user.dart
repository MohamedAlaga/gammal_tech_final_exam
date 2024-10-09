import 'package:flutter/material.dart';

class CardHistoryUser extends StatelessWidget {
  final String dateTime;
  final String title;
  final List<String> info;
  final String courseImage;

  const CardHistoryUser({
    super.key,
    required this.dateTime,
    required this.title,
    required this.info,
    required this.courseImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff094546)),
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
                              fontSize: 14,
                              color: Color(0xff094546),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  courseImage,
                  width: 84,
                  height: 98,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
