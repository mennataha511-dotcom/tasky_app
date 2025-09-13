import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF181818),
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFF15B86C),
      unselectedItemColor: const Color(0xFFC6C6C6),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/home.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? const Color(0xFF15B86C) : const Color(0xFFC6C6C6),
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/todo.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? const Color(0xFF15B86C) : const Color(0xFFC6C6C6),
              BlendMode.srcIn,
            ),
          ),
          label: 'To Do',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/completed.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? const Color(0xFF15B86C) : const Color(0xFFC6C6C6),
              BlendMode.srcIn,
            ),
          ),
          label: 'Completed',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/profile.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 3 ? const Color(0xFF15B86C) : const Color(0xFFC6C6C6),
              BlendMode.srcIn,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
