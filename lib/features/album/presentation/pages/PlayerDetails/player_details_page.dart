// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:album_da_copa_2022/features/album/data/models/football_player.dart';
import 'package:album_da_copa_2022/features/album/presentation/widgets/figure_card.dart';
import 'package:flutter/material.dart';

class PlayerDetailsPage extends StatefulWidget {
  final FootballPlayerModel player;
  const PlayerDetailsPage({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> {
  late final FootballPlayerModel player;

  @override
  void initState() {
    player = widget.player;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: AppBar(
        title: Text(player.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FigureCard(
          player: player,
          onTap: (() => Navigator.pop(context)),
        ),
      ),
    );
  }
}
