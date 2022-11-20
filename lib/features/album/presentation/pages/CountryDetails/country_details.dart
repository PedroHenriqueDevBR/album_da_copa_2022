import 'package:album_da_copa_2022/features/album/presentation/pages/CreatePlayer/create_player_page.dart';
import 'package:album_da_copa_2022/features/album/presentation/widgets/bottom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../data/models/country_model.dart';
import '../../widgets/figure_card.dart';

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
  late final CountryModel country;

  @override
  void initState() {
    country = widget.country;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              width: size.width,
              height: size.height * 0.3,
              child: Image.asset(country.flag),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                mainAxisExtent: 175,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.down,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const FigureCard();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Adicionar jogador',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreatePlayerPage(),
          ),
        ),
      ),
    );
  }
}
