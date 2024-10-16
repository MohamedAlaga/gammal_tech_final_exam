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
      body: const Center(
        child: Text('there is no any notification for the moment'),
      ),
    );
  }
}
