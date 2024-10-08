import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final bool isActive;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(10),
        curve: Curves.fastOutSlowIn,
        alignment: isActive ? Alignment.center : AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.orange : Colors.grey.shade400,
            ),
            if (isActive)
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.orange : Colors.grey.shade400,
                  fontSize: 14,
                ),
              )
          ],
        ),
      ),
    );
  }
}
