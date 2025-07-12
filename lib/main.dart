import 'package:flutter/material.dart';

import 'package:task5/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  ThemeData currentTheme(bool isDark) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20,
        ),
        backgroundColor: isDark
            ? const Color.fromARGB(255, 87, 84, 84)
            : const Color.fromARGB(255, 182, 204, 223),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: isDark ? Colors.white : Colors.black,
          backgroundColor: isDark
              ? const Color.fromARGB(255, 96, 92, 92)
              : Colors.white,
        ),
      ),

      scaffoldBackgroundColor: isDark
          ? const Color.fromARGB(255, 26, 25, 25)
          : const Color.fromARGB(255, 115, 163, 173),
    );
  }

  void setDarkMode() {
    setState(() {
      isDark = true;
    });
  }

  void setLightMode() {
    setState(() {
      isDark = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeController(
      isDark: isDark,
      setDarkMode: (bool isDark) => setDarkMode(),
      setLightMode: (bool isDark) => setLightMode(),
      child: MaterialApp(theme: currentTheme(isDark), home: MyHomePage()),
    );
  }
}

class ThemeController extends InheritedWidget {
  final bool isDark;
  final Function(bool) setLightMode;
  final Function(bool) setDarkMode;

  ThemeController({
    required this.isDark,
    required this.setLightMode,
    required this.setDarkMode,
    required Widget child,
  }) : super(child: child);

  static ThemeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
  }

  @override
  bool updateShouldNotify(ThemeController oldWidget) {
    return oldWidget.isDark != isDark;
  }
}
