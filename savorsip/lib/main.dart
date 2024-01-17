import 'package:flutter/material.dart';
import 'package:savorsip/Models/leaderboard.dart';
import 'package:savorsip/screens/authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:savorsip/theme_notifier.dart';
import 'firebase_options.dart';
import 'package:savorsip/components/color_schemes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Call the makeLeaderboard function after Firebase initialization
  await LeaderboardService.makeLeaderboard();
  await LeaderboardService.getLeaderboard();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SavorSip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'SavorSip',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      home: const Login(),
    );
  }
}
