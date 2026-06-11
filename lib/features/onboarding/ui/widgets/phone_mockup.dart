import 'package:flutter/material.dart';

class PhoneMockup extends StatelessWidget {
  final String imagePath;
  const PhoneMockup({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.transparent, Colors.black],
          stops: [0.0, 0.20],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
