import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedDialogContent extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedDialogContent({
    required this.animation,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Curva separada para diálogo
    final dialogCurve = Curves.easeOut.transform(animation.value);
    // Curva separada para fondo
    final backdropCurve = Curves.easeIn.transform(animation.value);

    return Stack(
      children: [
        // Fondo desenfocado animado con curva independiente
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5 * backdropCurve,
            sigmaY: 5 * backdropCurve,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.2 * backdropCurve),
          ),
        ),
        // Diálogo animado desde abajo con fade
        Center(
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - dialogCurve)),
            child: Opacity(opacity: dialogCurve, child: child),
          ),
        ),
      ],
    );
  }
}
