import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/dao/country_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/queries/country_queries.dart';
import '../../../domain/usecases/queries/fetch_all_countries.dart';
import '../CountryDetails/country_details_page.dart';
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Image.asset(store.images.logo),
          ),
        ),
        title: const Text('Album da copa'),
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
              child: Observer(
                builder: (_) {
                  return ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: store.countries.length,
                    itemBuilder: (_, index) {
                      final country = store.countries[index];
                      return Column(
                        children: [
                          ListTile(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CountryDetailsPage(country: country),
                              ),
                            ),
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
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
