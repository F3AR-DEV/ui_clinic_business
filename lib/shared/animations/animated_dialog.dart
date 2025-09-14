import 'package:flutter/material.dart';

class AnimatedDialog extends StatelessWidget {
  final Widget child;

  const AnimatedDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    );
  }
}
