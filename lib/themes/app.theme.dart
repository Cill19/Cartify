import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6200EA), // Warna utama (ungu)
    scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Latar belakang aplikasi
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF6200EA),
      secondary: const Color(0xFF03DAC6),
      background: const Color(0xFFF5F5F5),
      surface: Colors.white,
      error: const Color(0xFFB00020),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: const Color(0xFF212121),
      onSurface: const Color(0xFF212121),
      onError: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF212121)), // Teks utama
        bodyMedium: TextStyle(color: Color(0xFF757575)), // Teks sekunder
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        titleMedium: TextStyle(fontSize: 16, color: Color(0xFF6200EA)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6200EA),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4681F4), // Warna tombol utama
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6200EA),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6200EA),
      foregroundColor: Colors.white,
    ),
  );
}
