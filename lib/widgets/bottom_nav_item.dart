// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.onTap,
    required this.isActive,
    required this.position,
    required this.index,
  });

  final String label;
  final Function() onTap;
  final IconData iconData;
  final bool isActive;
  final double position;
  final int index;

  @override
  Widget build(BuildContext context) {
    final progress = (1 - (position - index).abs()).clamp(0.0, 1.0);
    final activeColor = Colors.red;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ripple effect
            if (isActive)
              TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 1.0 + (value * 0.5),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeColor.withOpacity(0.1 * (1 - value)),
                      ),
                    ),
                  );
                },
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, -4 * progress),
                  child: Transform.scale(
                    scale: 1.0 + (0.2 * progress),
                    child: Icon(
                      iconData,
                      color: Color.lerp(
                        Colors.black54,
                        activeColor,
                        progress,
                      ),
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Color.lerp(
                      Colors.black54,
                      activeColor,
                      progress,
                    ),
                    fontSize: 11 + (progress * 1),
                    fontWeight: FontWeight.lerp(
                      FontWeight.w400,
                      FontWeight.w600,
                      progress,
                    ),
                    letterSpacing: 0.2,
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
