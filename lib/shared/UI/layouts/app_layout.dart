// dashboard_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/desktop_layout.dart';

class AppLayout extends ConsumerWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenTypeLayout.builder(
      desktop: (context) => DesktopLayout(child: child),
      //tablet: (context) => TabletLayout(child: child),
      //mobile: (context) => MobileLayout(child: child),
    );
  }
}
