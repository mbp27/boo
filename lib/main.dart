import 'package:boo/pages/matching/matching_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooApp());
}

class BooApp extends StatelessWidget {
  const BooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MatchingPage(),
    );
  }
}
