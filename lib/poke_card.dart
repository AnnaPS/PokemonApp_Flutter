import 'package:flutter/material.dart';
import 'package:pokemonApp/pokemon_detail.dart';

import 'data/pokemon.dart';

class PokeCard extends StatefulWidget {
  Pokemon poke;

  PokeCard(Pokemon poke) {
    this.poke = poke;
  }

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetail(
                pokemon: widget.poke,
              ),
            ),
          );
        },
        child: Hero(
          tag: widget.poke.img,
          child: Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.poke.img),
                    ),
                  ),
                ),
                Text(
                  widget.poke.name,
                  style: TextStyle(
                      fontFamily: 'PokemonFont',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
