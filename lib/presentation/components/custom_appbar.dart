import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isProfileVisible;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback onLeftIconPressed;
  final VoidCallback onRightIconPressed;

  CustomAppBar({
    required this.isProfileVisible,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeftIconPressed,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isProfileVisible
          ? null
          : IconButton(
              icon: Icon(
                leftIcon,
                color: Colors.black,
              ),
              onPressed: onLeftIconPressed,
            ),
      title: isProfileVisible
          ? CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            )
          : null, // No title if profile isn't visible
      actions: [
        IconButton(
          icon: Icon(
            rightIcon,
            color: Colors.black,
          ),
          onPressed: onRightIconPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
