

import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackgroundCard extends StatelessWidget {
  final Widget child;

  const BlurBackgroundCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(51, 255, 255, 255),
                // Adjust opacity for transparency
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(77, 255, 255, 255)),
              ),
              padding: const EdgeInsets.all(16),
              child: child,
            )));
  }
}