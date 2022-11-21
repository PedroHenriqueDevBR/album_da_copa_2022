import 'package:flutter/material.dart';

import '../../../data/dao/player_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/models/football_player.dart';
import '../../../data/queries/football_player_queries.dart';
import '../../../domain/usecases/commands/delete_player_command.dart';
import '../../widgets/figure_card.dart';
import 'stores/player_details_store.dart';

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
  late final PlayerDetailsStore store;

  @override
  void initState() {
    final playerDao = FootballPlayerDaoImplementation(
      playerQueries: FootballPlayerSqlQueriesImplementation(),
      connection: SQFLiteConnection.instance,
    );
    store = PlayerDetailsStore(
      deletePlayerCommand: DeletePlayerCommand(playerDao: playerDao),
      player: widget.player,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: AppBar(
        title: Text(store.player.name),
        actions: [
          IconButton(
            onPressed: () async {
              await store.deletePlayer();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FigureCard(
          player: store.player,
          onTap: (() => Navigator.pop(context)),
        ),
      ),
    );
  }
}
