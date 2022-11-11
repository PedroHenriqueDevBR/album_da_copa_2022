import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FigureCard extends StatelessWidget {
  const FigureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            'https://images.pexels.com/photos/159684/soccer-football-soccer-player-sport-159684.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '10',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 32.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Jogador',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
