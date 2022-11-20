import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import 'features/album/presentation/pages/Album/album_page.dart';
import 'shared/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: Asuka.builder,
      navigatorObservers: [
        Asuka
            .asukaHeroController //This line is needed for the Hero widget to work
      ],
      title: 'album da Copa Qatar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const AlbumPage(),
      },
    );
  }
}
