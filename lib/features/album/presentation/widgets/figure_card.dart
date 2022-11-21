import 'package:flutter/material.dart';

import '../../data/models/football_player.dart';

class FigureCard extends StatelessWidget {
  final FootballPlayerModel player;
  const FigureCard({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(player.photo),
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
                    player.number,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    player.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 16.0,
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
