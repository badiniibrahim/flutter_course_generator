import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  const TextGradient({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          colors: [
            Colors.white,
            Colors.grey,
          ],
          tileMode: TileMode.mirror,
          radius: 2.0,
        ).createShader(bounds);
      },
      child: widget,
    );
  }
}
