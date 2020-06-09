import 'package:flutter/material.dart';

import 'data/pokemon.dart';

class BodyWidget extends StatefulWidget {
  Pokemon _pokemon;
  BodyWidget(Pokemon pokemon) {
    this._pokemon = pokemon;
  }

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Text(widget._pokemon.name,
                    style: TextStyle(fontFamily: 'PokemonFont', fontSize: 25)),
                Text("Height: ${widget._pokemon.height}",
                    style: TextStyle(fontFamily: 'PokemonFont')),
                Text("Weight: ${widget._pokemon.weight}",
                    style: TextStyle(fontFamily: 'PokemonFont')),
                Text("Types", style: TextStyle(fontFamily: 'PokemonFont')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget._pokemon.type
                      .map((type) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(
                              type,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PokemonFont'),
                            ),
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
                Text("Weakness", style: TextStyle(fontFamily: 'PokemonFont')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget._pokemon.weaknesses
                      .map((type) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              type,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PokemonFont'),
                            ),
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
                Text("Next Evolution",
                    style: TextStyle(fontFamily: 'PokemonFont')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget._pokemon.nextEvolution
                      .map((name) => FilterChip(
                            backgroundColor: Colors.cyan,
                            label: Text(
                              name.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PokemonFont'),
                            ),
                            onSelected: (b) {},
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
