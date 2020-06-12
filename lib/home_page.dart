import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:pokemonApp/poke_card.dart';

import 'data/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeHub pokeHub;
  String _URL =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

// I use async for block the UI until data are complet
  fetchData() async {
    var response = await http.get(_URL);
    print(response.body);
    pokeHub = PokeHub.fromJson(jsonDecode(response.body));
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pokemon App"),
          backgroundColor: Colors.red,
        ),
        body: pokeHub == null
            ? Center(
                child: AwesomeLoader(
                loaderType: AwesomeLoader.AwesomeLoader3,
                color: Colors.red,
              ))
            : GridView.count(
                crossAxisCount: 2,
                children:
                    pokeHub.pokemon.map((poke) => PokeCard(poke)).toList(),
              ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchData();
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
