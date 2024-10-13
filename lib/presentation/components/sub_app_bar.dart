import 'package:flutter/material.dart';

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SubAppBar({
    super.key,
    required this.rightIcon,
    required this.onRightIconPressed,
  });

  final IconData rightIcon;
  final VoidCallback onRightIconPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.navigate_before,
            size: 28,
            color:  Color(0xff094546),
          )),
      actions: [
        IconButton(
          icon: Icon(
            rightIcon,
            color: const Color(0xff094546),
          ),
          onPressed: onRightIconPressed,
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
