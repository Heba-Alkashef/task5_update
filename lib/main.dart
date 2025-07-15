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
  ThemeMode theme = ThemeMode.light;

  ThemeData currentTheme(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            backgroundColor: Color.fromARGB(255, 182, 204, 223),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(160, 50),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),

          scaffoldBackgroundColor: const Color.fromARGB(255, 115, 163, 173),
        );

      case ThemeMode.dark:
        return ThemeData(
          scaffoldBackgroundColor: const Color(0xFF000000),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 96, 92, 92),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(160, 50),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 96, 92, 92),
            ),
          ),
        );

      case ThemeMode.system:
        return ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0D1B2A),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1B263B),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(160, 50),
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF415A77),
            ),
          ),
        );
    }
  }

  void setDarkMode() {
    setState(() {
      theme = ThemeMode.dark;
    });
  }

  void setSystemMode() {
    setState(() {
      theme = ThemeMode.system;
    });
  }

  void setLightMode() {
    setState(() {
      theme = ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeController(
      theme: theme,
      setDarkMode: (ThemeMode theme) => setDarkMode(),
      setSystemMode: (ThemeMode theme) => setSystemMode(),
      setLightMode: (ThemeMode theme) => setLightMode(),
      child: MaterialApp(theme: currentTheme(theme), home: MyHomePage()),
    );
  }
}

class ThemeController extends InheritedWidget {
  final ThemeMode theme;
  final Function(ThemeMode) setLightMode;
  final Function(ThemeMode) setDarkMode;
  final Function(ThemeMode) setSystemMode;

  ThemeController({
    required this.theme,
    required this.setSystemMode,
    required this.setLightMode,
    required this.setDarkMode,
    required Widget child,
  }) : super(child: child);

  static ThemeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
  }

  @override
  bool updateShouldNotify(ThemeController oldWidget) {
    return oldWidget.theme != theme;
  }
}
