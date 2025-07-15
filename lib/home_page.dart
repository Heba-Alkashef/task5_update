import 'package:flutter/material.dart';
import 'package:task5/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ThemeController.of(
                  context,
                ).setLightMode(ThemeController.of(context).theme);
              },
              child: Text('Light Mode'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ThemeController.of(
                  context,
                ).setBlackDarkMode(ThemeController.of(context).theme);
              },
              child: Text('Black Dark Mode'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ThemeController.of(
                  context,
                ).setBlueDarkMode(ThemeController.of(context).theme);
              },
              child: Text('Blue Dark Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
