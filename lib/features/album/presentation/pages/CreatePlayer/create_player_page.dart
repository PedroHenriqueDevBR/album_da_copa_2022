import 'package:flutter/material.dart';

import '../../../data/dao/player_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/models/country_model.dart';
import '../../../data/queries/football_player_queries.dart';
import '../../../domain/usecases/commands/create_player_command.dart';
import '../../../domain/usecases/commands/update_player_command.dart';
import '../../widgets/bottom_button.dart';
import 'stores/create_player_store.dart';

class CreatePlayerPage extends StatefulWidget {
  final CountryModel country;
  const CreatePlayerPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<CreatePlayerPage> createState() => _CreatePlayerPageState();
}

class _CreatePlayerPageState extends State<CreatePlayerPage> {
  late final CreatePlayerStore store;

  @override
  void initState() {
    final playerDao = FootballPlayerDaoImplementation(
      playerQueries: FootballPlayerSqlQueriesImplementation(),
      connection: SQFLiteConnection.instance,
    );
    store = CreatePlayerStore(
      createPlayerCommand: CreatePlayerCommand(playerDao: playerDao),
      updatePlayerCommand: UpdatePlayerCommand(playerDao: playerDao),
      country: widget.country,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar jogador'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(64),
              width: size.width,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(64.0),
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(store.images.player),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: store.setName,
                    initialValue: store.name,
                    decoration: const InputDecoration(
                      label: Text('Nome do jogador'),
                    ),
                  ),
                  TextFormField(
                    onChanged: store.setNumber,
                    initialValue: store.number,
                    decoration: const InputDecoration(
                      label: Text('Número da camisa'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Salvar',
        onTap: store.registerPlayer,
      ),
    );
  }
}
