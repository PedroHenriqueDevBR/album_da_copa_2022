import 'package:album_da_copa_2022/features/album/presentation/pages/Album/album_page.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/styles/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final images = AppImages();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120.0),
                  ),
                ),
                child: Image.asset(
                  images.logo,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Albúm da copa'),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumPage(),
                      ),
                    ),
                    child: const Text('Entrar com google'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Desenvolvido por Pedro Henrique'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
