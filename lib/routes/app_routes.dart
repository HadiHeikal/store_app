import 'package:flutter/material.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(body: Center(child: Text('Hello, World!'))),
      // Define the routes for the application
      routes: {
        '/home': (context) =>
            const Scaffold(body: Center(child: Text('Home Page'))),
        '/about': (context) =>
            const Scaffold(body: Center(child: Text('About Page'))),
      },
    );
  }
}
