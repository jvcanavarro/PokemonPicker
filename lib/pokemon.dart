import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Future<List<String>> getPokemon() async {
  var rng = new Random();
  var pokemon = rng.nextInt(1050).toString();
  var url = "https://pokeapi.co/api/v2/pokemon-form/" + pokemon;

  try {
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var pokeName = json['pokemon']['name'];
    var pokeImage = json['sprites']['front_default'];

    // print(pokeName);
    // print(pokeImage);
    return [pokeName, pokeImage];
  } catch (e) {
    return ['Error: Pokemon $pokemon Not Found.'];
  }
}
