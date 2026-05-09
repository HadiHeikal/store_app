import 'package:flutter/material.dart';
import 'package:store_app/features/home/views/home_root.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => HomeRoot()},
    );
  }
}
