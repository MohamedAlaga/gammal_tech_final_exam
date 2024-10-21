import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.navigate_before,
              size: 28,
              color: Color(0xff094546),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/not_fond.png',
              width: 256,
            ),
            const Text(
              'There is no notification',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'SourceSans3',
                fontWeight: FontWeight.w600,
                color: Color(0xff094546),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
