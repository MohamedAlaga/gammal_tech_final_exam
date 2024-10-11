import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_profile_screen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.rightIcon,
    required this.onNotificationPressed,
    required this.image,
  });

  final String image;
  final IconData rightIcon;
  final VoidCallback onNotificationPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      toolbarHeight: 44,
      leadingWidth: 44,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserProfileScreen(),
              ),
            );
          },
          child: CircleAvatar(
            backgroundImage: _getImageProvider(image),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconButton(
            icon: Icon(
              rightIcon,
              color: const Color(0xff094546),
            ),
            onPressed: onNotificationPressed,
          ),
        ),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
