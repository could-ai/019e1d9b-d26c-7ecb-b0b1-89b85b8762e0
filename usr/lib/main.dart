import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/maps_screen.dart';
import 'screens/map_detail_screen.dart';
import 'screens/wiki_screen.dart';
import 'screens/esports_screen.dart';

void main() {
  runApp(const RoavchikApp());
}

class RoavchikApp extends StatelessWidget {
  const RoavchikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roavchik School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F13),
        primaryColor: const Color(0xFFFF3B30),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF3B30),
          secondary: Color(0xFFFF9500),
          surface: Color(0xFF1C1C23),
          background: Color(0xFF0F0F13),
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F13),
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/maps': (context) => const MapsScreen(),
        '/map_detail': (context) => const MapDetailScreen(),
        '/wiki': (context) => const WikiScreen(),
        '/esports': (context) => const EsportsScreen(),
      },
    );
  }
}
