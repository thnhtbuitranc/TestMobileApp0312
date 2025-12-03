import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Sky Blue (from website)
  static const Color primary = Color(0xFF0EA5E9); // Sky Blue 500
  static const Color primaryDark = Color(0xFF0284C7); // Sky Blue 600
  static const Color primaryLight = Color(0xFF38BDF8); // Sky Blue 400
  
  // Secondary Colors
  static const Color secondary = Color(0xFF7DD3FC); // Light Sky Blue
  static const Color accent = Color(0xFFBAE6FD); // Very Light Sky Blue
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFF0F9FF); // Light Blue Background
  static const Color surfaceLight = Colors.white;
  static const Color backgroundDark = Color(0xFF0C4A6E); // Dark Blue
  static const Color surfaceDark = Color(0xFF075985);
  
  // Functional Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Gradients - Sky Blue theme
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient sleepGradient = LinearGradient(
    colors: [Color(0xFF38BDF8), Color(0xFF0EA5E9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
