import 'package:album_da_copa_2022/shared/styles/theme.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'album da Copa Qatar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
