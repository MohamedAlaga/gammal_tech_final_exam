import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class TopicCardShimmer extends StatelessWidget {
  const TopicCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color(0xffE3E5E8),
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
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    width: 100,
                    height: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    width: 100,
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color(0xFFFFFFFF),
                        width: 100,
                        height: 20,
                      ),
                      const SizedBox(height: 3),
                      Container(
                        color: const Color(0xFFFFFFFF),
                        width: 100,
                        height: 20,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    width: 64,
                    height: 56,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CustomButton(
                    text: 'More',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    width: 85,
                    borderRadius: 3,
                    fontSize: 16,
                    onTap: () {},
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Start',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    width: 85,
                    borderRadius: 3,
                    fontSize: 16,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextShimmer extends StatelessWidget {
  const TextShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        color: const Color(0xFFFFFFFF),
        width: 100,
        height: 20,
      ),
    );
  }
}

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color(0xffE3E5E8),
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
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    width: 100,
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color(0xFFFFFFFF),
                        width: 160,
                        height: 26,
                      ),
                      const SizedBox(height: 3),
                      Container(
                        color: const Color(0xFFFFFFFF),
                        width: 100,
                        height: 22,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    width: 64,
                    height: 56,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    color: const Color(0xFFFFFFFF),
                    width: 120,
                    height: 30,
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Start',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    width: 85,
                    borderRadius: 3,
                    fontSize: 16,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContinueCourseShimmer extends StatelessWidget {
  const CardContinueCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFF904D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: const TextShimmer(),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          color: const Color(0xFFFFFFFF),
                          width: 160,
                          height: 20,
                        )),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12, top: 12),
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    width: 64,
                    height: 56,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xffFF904D)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomButton(
                text: "",
                textColor: Colors.white,
                buttonColor: const Color(0xff094546),
                borderColor: const Color(0xff094546),
                width: double.infinity,
                borderRadius: 3,
                fontSize: 16,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardFinishExamCourseShimmer extends StatelessWidget {
  const CardFinishExamCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFF904D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: const Text(
                        "              ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        width: 160,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/done.png',
                    width: 54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCardShimmer extends StatelessWidget {
  const MemberCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(136, 9, 69, 70),
        highlightColor: const Color(0xffF4F5F7),
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(right: 12, left: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE3E5E8), width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 16,
                color: const Color(0xffFF904D),
              ),
              const SizedBox(width: 3),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xffFF904D),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 80,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 30,
                height: 16,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopMemberCardShimmer extends StatelessWidget {
  const TopMemberCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Column(
        children: [
          // Shimmer for profile picture and rank badge
          Stack(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey[300],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Shimmer for the name
          Container(
            width: 80,
            height: 16,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 4),
          // Shimmer for the college
          Container(
            width: 60,
            height: 14,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 4),
          Container(
            width: 40,
            height: 16,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class HistoryCardShimmer extends StatelessWidget {
  const HistoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(136, 9, 69, 70),
      highlightColor: const Color(0xffF4F5F7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFF904D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: const Text(
                        "                            ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        width: 100,
                        height: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        width: 120,
                        height: 18,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
