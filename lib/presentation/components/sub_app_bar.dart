import 'package:flutter/material.dart';

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SubAppBar({
    super.key,
    required this.rightIcon,
    required this.onRightIconPressed,
    required this.appBarColor,
    required this.iconsColor,
  });

  final Color appBarColor;
  final IconData rightIcon;
  final Color iconsColor;
  final VoidCallback onRightIconPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: appBarColor,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.navigate_before,
            size: 28,
            color: iconsColor,
          )),
      actions: [
        IconButton(
          icon: Icon(
            rightIcon,
            color: iconsColor,
          ),
          onPressed: onRightIconPressed,
        ),
      ],
    );
  }
}
