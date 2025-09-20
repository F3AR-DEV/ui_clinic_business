import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  final Widget child;
  const TabletLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")), // Navbar simplificada
      //drawer: const Sidebar(), // Sidebar en un drawer
      body: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}
