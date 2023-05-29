import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi_praktpm/models/model_characters.dart';
import 'package:latihan_responsi_praktpm/models/model_weapons.dart';

class GenshinApi {
  Future<List<dynamic>> getCharacterList() async {
    var url = Uri.parse('https://api.genshin.dev/characters');
    var response = await http.get(url);

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return data;
  }

  Future<List<dynamic>> getWeaponList() async {
    var url = Uri.parse('https://api.genshin.dev/weapons');
    var response = await http.get(url);

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return data;
  }

  Future<CharactersModel> getCharacterDetail(String name) async {
    var url = Uri.parse('https://api.genshin.dev/characters/$name');
    var response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return CharactersModel.fromJson(data);
  }

  Future<WeaponsModel> getWeaponDetail(String name) async {
    print(name);
    var url = Uri.parse('https://api.genshin.dev/weapons/$name');
    var response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return WeaponsModel.fromJson(data);
  }
}
