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
  List<FilterChip> _hasNextEvolution() {
    return widget._pokemon.nextEvolution
        .map((name) => FilterChip(
              backgroundColor: Colors.cyan,
              label: Text(
                name.name,
                style:
                    TextStyle(color: Colors.white, fontFamily: 'PokemonFont'),
              ),
              onSelected: (b) {},
            ))
        .toList();
  }

  Widget _dontHaveNextEvolution() {
    return FilterChip(
      backgroundColor: Colors.cyan,
      label: Text(
        "This pokemon dont't have next evolution",
        style: TextStyle(color: Colors.white, fontFamily: 'PokemonFont'),
      ),
      onSelected: (b) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(widget._pokemon.name,
                    style: TextStyle(
                        fontFamily: 'PokemonFont',
                        fontSize: 35,
                        fontWeight: FontWeight.w600)),
                Text("Height: ${widget._pokemon.height}",
                    style: TextStyle(fontFamily: 'PokemonFont')),
                Text("Weight: ${widget._pokemon.weight}",
                    style: TextStyle(fontFamily: 'PokemonFont')),
                Text(
                  "Types",
                  style: TextStyle(
                      fontFamily: 'PokemonFont',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
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
                Text(
                  "Weakness",
                  style: TextStyle(
                      fontFamily: 'PokemonFont',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
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
                Text(
                  "Next Evolution",
                  style: TextStyle(
                      fontFamily: 'PokemonFont',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget._pokemon.nextEvolution != null
                      ? _hasNextEvolution()
                      : [
                          _dontHaveNextEvolution(),
                        ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget._pokemon.img,
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget._pokemon.img),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
