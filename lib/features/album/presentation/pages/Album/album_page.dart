import 'package:album_da_copa_2022/features/album/data/models/country_model.dart';
import 'package:album_da_copa_2022/features/album/presentation/widgets/figure_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/styles/images.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final images = AppImages();
  final List<CountryModel> countries = [];

  void loadCoutries() {
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-catar.jpg',
      name: 'Catar',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/equador.jpg',
      name: 'Equador',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/holanda.JPG',
      name: 'Holanda',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/senegal.JPG',
      name: 'Senegal',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/estados-unidos.jpg',
      name: 'Estados Unidos',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s4.static.brasilescola.uol.com.br/be/2022/10/bandeira-inglaterra.jpg',
      name: 'Inglaterra',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/ira.jpg',
      name: 'Irã',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-pais-de-gales.jpg',
      name: 'País de Gales',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s5.static.brasilescola.uol.com.br/be/2022/10/argentina.JPG',
      name: 'Argentina',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/arabia-saudita.JPG',
      name: 'Arábia Saudita',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/mexico.jpg',
      name: 'México',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-polonia.jpg',
      name: 'Polônia',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s2.static.brasilescola.uol.com.br/be/2022/10/australia.JPG',
      name: 'Austrália',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s1.static.brasilescola.uol.com.br/be/2022/10/dinamarca.jpg',
      name: 'Dinamarca',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/franca.jpg',
      name: 'França',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/tunisia.jpg',
      name: 'Tunísia',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/alemanha.JPG',
      name: 'Alemanha',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s1.static.brasilescola.uol.com.br/be/2022/10/costa-rica.jpg',
      name: 'Costa Rica',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/espanha.jpg',
      name: 'Espanha',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/japao.jpg',
      name: 'Japão',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/belgica.jpg',
      name: 'Bélgica',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/canada.JPG',
      name: 'Canadá',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/croacia.jpg',
      name: 'Croácia',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/marrocos.jpg',
      name: 'Marrocos',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/brasil.JPG',
      name: 'Brasil',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/camaroes.jpg',
      name: 'Camarões',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/suica.JPG',
      name: 'Suíça',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/servia.jpg',
      name: 'Sérvia',
      figures: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s2.static.brasilescola.uol.com.br/be/2022/10/bandeira-coreia-do-sul.jpg',
      name: 'Coreia do Sul',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/gana.jpg',
      name: 'Gana',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/portugal.jpg',
      name: 'Portugal',
      figures: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/uruguai.jpg',
      name: 'Uruguai',
      figures: [],
    ));
  }

  @override
  void initState() {
    loadCoutries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          CircleAvatar(
            child: Image.asset(images.logo),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (_, index) {
          final country = countries[index];
          return Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 60,
                  child: Card(
                    child: CachedNetworkImage(imageUrl: country.flag),
                  ),
                ),
                trailing: Text(
                  country.name,
                  style: TextStyle(
                    color: colorScheme.onBackground,
                    fontSize: 16.0,
                  ),
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
      ),
      drawer: DrawerMenu(colorScheme: colorScheme),
      bottomNavigationBar: buyFiguresWidget(colorScheme: colorScheme),
    );
  }

  Widget buyFiguresWidget({required ColorScheme colorScheme}) {
    return Container(
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
    );
  }

  Widget DrawerMenu({required ColorScheme colorScheme}) {
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
                  child: Image.asset(images.logo),
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
                itemCount: countries.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final country = countries[index];
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
