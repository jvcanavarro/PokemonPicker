import 'package:flutter/material.dart';
import 'pokemon.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // TODO: switch .png to another placeholder.
  var pokemon = ['Pokemon', 'white.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pokemon Picker")),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.network(pokemon[1]),
            Text(
              pokemon[0],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              getPokemon().then((value) => pokemon = value);
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
