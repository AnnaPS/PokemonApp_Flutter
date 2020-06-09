import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemonApp/data/pokemon.dart';

class PokeApiManager {
  PokeApiManager() {}

  PokeHub pokeHub;
  String _URL =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

// I use async for block the ui until data are complet
  fetchData() async {
    var response = await http.get(_URL);
    print(response.body);
    var decodedJson = jsonDecode(response.body);

    pokeHub = PokeHub.fromJson(decodedJson);
  }

  List<Widget> mapDataCard() {
    pokeHub.pokemon.map((poke) => Card()).toList();
  }
}
