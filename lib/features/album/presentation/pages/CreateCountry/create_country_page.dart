import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/dao/country_dao_implementation.dart';
import '../../../data/datasources/sqlite_datasource.dart';
import '../../../data/models/country_model.dart';
import '../../../data/queries/country_queries.dart';
import '../../../domain/usecases/commands/create_country_command.dart';
import '../../../domain/usecases/commands/update_country_command.dart';
import '../../widgets/bottom_button.dart';
import 'stores/create_country_store.dart';

class CreateCountryPage extends StatefulWidget {
  final CountryModel? country;
  const CreateCountryPage({
    Key? key,
    this.country,
  }) : super(key: key);

  @override
  State<CreateCountryPage> createState() => _CreateCountryPageState();
}

class _CreateCountryPageState extends State<CreateCountryPage> {
  late final CreateCountryStore store;

  @override
  void initState() {
    final countryDao = CountryDaoImplementation(
      countryQueries: CountrySqlQueriesImplementation(),
      connection: SQFLiteConnection.instance,
    );

    store = CreateCountryStore(
      country: widget.country,
      createCountryCommand: CreateCountryCommand(countryDao: countryDao),
      updateCountryCommand: UpdateCountryCommand(countryDao: countryDao),
    );

    store.loadFlags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar pais'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: store.countryName,
              onChanged: store.setCountryName,
              decoration: const InputDecoration(
                label: Text('Nome'),
              ),
            ),
            GridView.builder(
              itemCount: store.flags.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () => store.selectFlag(index),
                  child: Observer(
                    builder: (_) {
                      return Card(
                        color: store.selectedFlagIndex == index
                            ? colorScheme.primary
                            : null,
                        child: Image.asset(store.flags[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Salvar',
        onTap: store.registerCountry,
      ),
    );
  }
}
