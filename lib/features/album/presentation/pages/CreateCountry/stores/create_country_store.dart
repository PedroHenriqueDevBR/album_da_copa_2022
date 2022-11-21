import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../data/models/country_model.dart';
import '../../../../domain/usecases/commands/create_country_command.dart';
import '../../../../domain/usecases/commands/update_country_command.dart';

part 'create_country_store.g.dart';

class CreateCountryStore extends _CreateCountryStoreBase
    with _$CreateCountryStore {
  CreateCountryStore({
    required CreateCountryCommand createCountryCommand,
    required UpdateCountryCommand updateCountryCommand,
    required CountryModel? country,
  }) {
    super.createCountryCommand = createCountryCommand;
    super.updateCountryCommand = updateCountryCommand;
    super.savedCountry = country;
  }
}

abstract class _CreateCountryStoreBase with Store {
  final images = AppImages();
  CountryModel? savedCountry;

  @observable
  int selectedFlagIndex = -1;
  @observable
  String countryName = '';

  final ObservableList<String> flags = ObservableList<String>();

  late final CreateCountryCommand createCountryCommand;
  late final UpdateCountryCommand updateCountryCommand;

  @action
  void loadFlags() {
    if (savedCountry != null) setCountryName(savedCountry!.name);
    flags.addAll([
      images.catar,
      images.equador,
      images.holanda,
      images.senegal,
      images.estadosUnidos,
      images.inglaterra,
      images.ira,
      images.paisDeGales,
      images.arabiaSaudita,
      images.mexico,
      images.polonia,
      images.australia,
      images.dinamarca,
      images.franca,
      images.tunisia,
      images.alemanha,
      images.costaRica,
      images.espanha,
      images.japao,
      images.belgica,
      images.canada,
      images.croacia,
      images.marrocos,
      images.brasil,
      images.camaroes,
      images.suica,
      images.servia,
      images.coreiaDoSul,
      images.gana,
      images.portugal,
      images.uruguai,
    ]);
  }

  @action
  void setCountryName(String value) => countryName = value;

  @action
  void selectFlag(int index) => selectedFlagIndex = index;

  void registerCountry() =>
      savedCountry == null ? _createCountry() : _updateCountry();

  void _isValidForm() {
    if (countryName.isEmpty) {
      showMessage('Digite o nome do país');
      throw InvalidDataException();
    } else if (selectedFlagIndex == -1) {
      showMessage('Selecione uma bandeira');
      throw InvalidDataException();
    }
  }

  void _createCountry() async {
    try {
      _isValidForm();
      CountryModel country = CountryModel(
        flag: flags[selectedFlagIndex],
        name: countryName,
        figures: [],
      );
      final response = await createCountryCommand.call(country: country);
      country.id = response;
      savedCountry = country;
      showMessage('Dados registrados');
    } on InvalidDataException {
      showMessage('Verifique os dados e tente novamente');
    } on RegisteredDataException {
      showMessage('País já cadastrado!');
    } on ServerException {
      showMessage('Erro ao acessar banco de dados');
    }
  }

  void _updateCountry() async {
    try {
      _isValidForm();
      savedCountry!.name = countryName;
      savedCountry!.flag = flags[selectedFlagIndex];
      await updateCountryCommand.call(country: savedCountry!);
      showMessage('Dados registrados');
    } on InvalidDataException {
      showMessage('Verifique os dados e tente novamente');
    } on ServerException {
      showMessage('Erro ao acessar banco de dados');
    }
  }

  void showMessage(String message) {
    asuka.showSnackBar(SnackBar(content: Text(message)));
  }
}
