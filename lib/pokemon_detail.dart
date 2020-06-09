import 'package:flutter/material.dart';
import 'package:pokemonApp/poke_detail_body.dart';

import 'data/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text(pokemon.name),
        ),
        body: BodyWidget(pokemon),
      ),
    );
  }
}
