import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/dao/country_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/queries/country_queries.dart';
import '../../../domain/usecases/queries/fetch_all_countries.dart';
import '../../widgets/bottom_button.dart';
import '../../widgets/figure_card.dart';
import '../CreateCountry/create_country_page.dart';
import 'stores/album_store.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late final AlbumStore store;

  @override
  void initState() {
    final countryDao = CountryDaoImplementation(
      countryQueries: CountrySqlQueriesImplementation(),
      connection: SQFLiteConnection.instance,
    );
    store = AlbumStore(
      fetchCountries: FetchCountriesQuery(countryDao: countryDao),
    );
    store.loadCoutries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          CircleAvatar(
            child: Image.asset(store.images.logo),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: size.width,
              color: colorScheme.surface,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: store.filterCoutries,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        label: Text('Pesquisar...'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateCountryPage(),
                        ),
                      );
                      store.loadCoutries();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: store.countries.length,
                  itemBuilder: (_, index) {
                    final country = store.countries[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                            width: 60,
                            child: Card(
                              child: Image.asset(country.flag),
                            ),
                          ),
                          title: Text(
                            country.name,
                            style: TextStyle(
                              color: colorScheme.onBackground,
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateCountryPage(
                                    country: country,
                                  ),
                                ),
                              );
                              store.loadCoutries();
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                        SizedBox(
                          height: 166 * 3,
                          child: Scrollbar(
                            interactive: true,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                mainAxisExtent: 175,
                              ),
                              dragStartBehavior: DragStartBehavior.down,
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const FigureCard();
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      drawer: drawerMenu(colorScheme: colorScheme),
      bottomNavigationBar: BottomButton(
        text: 'Comprar figurinhas',
        onTap: () {},
      ),
    );
  }

  Widget drawerMenu({required ColorScheme colorScheme}) {
    return Drawer(
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
                SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(store.images.logo),
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meu albúm',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '40/100 figurinhas',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w400,
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
                itemCount: store.countries.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final country = store.countries[index];
                  return ListTile(
                    leading: SizedBox(
                      width: 50,
                      child: CachedNetworkImage(imageUrl: country.flag),
                    ),
                    title: Text(
                      country.name,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    trailing: const Icon(Icons.add),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
