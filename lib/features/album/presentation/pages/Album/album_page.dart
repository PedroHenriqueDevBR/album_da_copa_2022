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
          title: Text(
            'Seleção $index',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: colorScheme.secondary,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome do usuário',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '40/100 figurinhas',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: colorScheme.background,
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) => ListTile(
                    title: Text(
                      'Seleção $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
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
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            backgroundColor: colorScheme.secondary,
          ),
          child: const Text('Comprar figurinhas'),
        ),
      ),
    );
  }
}
