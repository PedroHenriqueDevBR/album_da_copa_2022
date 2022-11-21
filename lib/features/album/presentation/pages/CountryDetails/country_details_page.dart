import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/dao/player_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/models/country_model.dart';
import '../../../data/queries/football_player_queries.dart';
import '../../../domain/usecases/queries/fetch_players_by_country.dart';
import '../../widgets/bottom_button.dart';
import '../../widgets/figure_card.dart';
import '../CreatePlayer/create_player_page.dart';
import 'stores/country_details_store.dart';

class CountryDetailsPage extends StatefulWidget {
  final CountryModel country;
  const CountryDetailsPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  late final CountryDetailsStore store;

  @override
  void initState() {
    final playerDao = FootballPlayerDaoImplementation(
      playerQueries: FootballPlayerSqlQueriesImplementation(),
      connection: SQFLiteConnection.instance,
    );
    store = CountryDetailsStore(
      fetchPlayersByCountry: FetchPlayersByCountryQuery(playerDao: playerDao),
      country: widget.country,
    );
    store.loadPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(store.country.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorScheme.primary,
              padding: const EdgeInsets.all(32.0),
              width: size.width,
              height: size.height * 0.3,
              child: Image.asset(store.country.flag),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jogadores',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Observer(
              builder: (_) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    mainAxisExtent: 175,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  dragStartBehavior: DragStartBehavior.down,
                  itemCount: store.players.length,
                  itemBuilder: (context, index) {
                    final player = store.players[index];
                    return FigureCard(player: player);
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Adicionar jogador',
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePlayerPage(
                country: store.country,
              ),
            ),
          );
          store.loadPlayers();
        },
      ),
    );
  }
}
