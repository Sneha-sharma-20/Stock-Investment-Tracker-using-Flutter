import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: const AssetImage('assets/images/graph.png'),
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,
          opacity: 0.15,
          colorFilter: ColorFilter.mode(
            Colors.blue.withOpacity(0.3),
            BlendMode.srcIn,
          ),
        ),
      ),
      child: child,
    );
  }
}