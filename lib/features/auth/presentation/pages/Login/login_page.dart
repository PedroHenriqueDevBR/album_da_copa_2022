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
              flex: 2,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120.0),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 120.0,
                    child: Image.asset(images.logo),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Albúm da copa',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumPage(),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.person_2_outlined),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Center(child: Text('Entrar com google')),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Desenvolvido por Pedro Henrique'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
