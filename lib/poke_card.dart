import 'package:awesome_loader/awesome_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      child: CachedNetworkImage(
          imageUrl: widget.poke.img,
          imageBuilder: (context, imageProvider) => InkWell(
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
                              image: imageProvider,
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
          placeholder: (context, url) => AwesomeLoader(
                loaderType: AwesomeLoader.AwesomeLoader3,
                color: Colors.red,
              ),
          errorWidget: (context, url, error) => Icon(Icons.error)),
    );
  }
}
