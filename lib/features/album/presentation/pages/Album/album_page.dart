import 'package:flutter/material.dart';

import '../../../../../shared/styles/images.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final images = AppImages();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            child: Image.asset(images.logo),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Seleção $index'),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.secondary,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade200,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Nome do usuário'),
                      Text('40/100 figurinhas'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) => ListTile(
                  title: Text('Seleção $index'),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: colorScheme.secondary,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: colorScheme.secondary,
          ),
          child: const Text('Comprar figurinhas'),
        ),
      ),
    );
  }
}
