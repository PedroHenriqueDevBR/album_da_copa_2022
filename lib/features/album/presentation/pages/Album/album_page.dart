import 'package:album_da_copa_2022/features/album/data/models/country_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/equador.jpg',
      name: 'Equador',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/holanda.JPG',
      name: 'Holanda',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/senegal.JPG',
      name: 'Senegal',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/estados-unidos.jpg',
      name: 'Estados Unidos',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s4.static.brasilescola.uol.com.br/be/2022/10/bandeira-inglaterra.jpg',
      name: 'Inglaterra',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/ira.jpg',
      name: 'Irã',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-pais-de-gales.jpg',
      name: 'País de Gales',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s5.static.brasilescola.uol.com.br/be/2022/10/argentina.JPG',
      name: 'Argentina',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/arabia-saudita.JPG',
      name: 'Arábia Saudita',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/mexico.jpg',
      name: 'México',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s3.static.brasilescola.uol.com.br/be/2022/10/bandeira-polonia.jpg',
      name: 'Polônia',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s2.static.brasilescola.uol.com.br/be/2022/10/australia.JPG',
      name: 'Austrália',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s1.static.brasilescola.uol.com.br/be/2022/10/dinamarca.jpg',
      name: 'Dinamarca',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/franca.jpg',
      name: 'França',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/tunisia.jpg',
      name: 'Tunísia',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/alemanha.JPG',
      name: 'Alemanha',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s1.static.brasilescola.uol.com.br/be/2022/10/costa-rica.jpg',
      name: 'Costa Rica',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/espanha.jpg',
      name: 'Espanha',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/japao.jpg',
      name: 'Japão',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/belgica.jpg',
      name: 'Bélgica',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/canada.JPG',
      name: 'Canadá',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/croacia.jpg',
      name: 'Croácia',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/marrocos.jpg',
      name: 'Marrocos',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s1.static.brasilescola.uol.com.br/be/2022/10/brasil.JPG',
      name: 'Brasil',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/camaroes.jpg',
      name: 'Camarões',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s5.static.brasilescola.uol.com.br/be/2022/10/suica.JPG',
      name: 'Suíça',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/servia.jpg',
      name: 'Sérvia',
      players: [],
    ));
    countries.add(CountryModel(
      flag:
          'https://s2.static.brasilescola.uol.com.br/be/2022/10/bandeira-coreia-do-sul.jpg',
      name: 'Coreia do Sul',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s2.static.brasilescola.uol.com.br/be/2022/10/gana.jpg',
      name: 'Gana',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/portugal.jpg',
      name: 'Portugal',
      players: [],
    ));
    countries.add(CountryModel(
      flag: 'https://s4.static.brasilescola.uol.com.br/be/2022/10/uruguai.jpg',
      name: 'Uruguai',
      players: [],
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
                  width: 50,
                  child: CachedNetworkImage(imageUrl: country.flag),
                ),
                trailing: Text(
                  country.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                height: 166,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 150,
                      width: 120,
                      child: Container(
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
                            Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      drawer: Drawer(
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
                  const SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome do usuário',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '40/100 figurinhas',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
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
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
