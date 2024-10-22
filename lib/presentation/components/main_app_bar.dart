import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_profile_screen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.rightIcon,
    required this.onNotificationPressed,
    required this.image,
    required this.appBarrColor,
    required this.rightIconColor,
  });

  final String image;
  final IconData rightIcon;
  final VoidCallback onNotificationPressed;
  final Color appBarrColor;
  final Color rightIconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: appBarrColor,
      toolbarHeight: 44,
      leadingWidth: 44,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<UserProfileBloc>(context)
                .add(GetUserProfileEvent());
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 140),
                transitionsBuilder:
                    (context, firstAnimation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(firstAnimation),
                    child: child,
                  );
                },
                pageBuilder: (context, firstAnimation, secondaryAnimation) =>
                    MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<UserProfileBloc>(context),
                  )
                ], child: UserProfileScreen()),
              ),
            );
          },
          child: CircleAvatar(
            backgroundImage: _getImageProvider(image),
            backgroundColor: appBarrColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconButton(
            icon: Icon(
              rightIcon,
              color: rightIconColor,
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
