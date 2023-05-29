import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/api_calls/api_genshin.dart';
import 'package:latihan_responsi_praktpm/models/model_characters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterDetailPage extends StatefulWidget {
  String name;
  CharacterDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  Future<void> _setLastOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_open', widget.name);
    prefs.setString('code', 'characters');
  }

  @override
  void initState() {
    super.initState();
    _setLastOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
              "Detail ${widget.name[0].toUpperCase()}${widget.name.substring(1).toLowerCase()}"),
        ),
        body: FutureBuilder(
          future: GenshinApi().getCharacterDetail(widget.name),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Tidak ada data"),
                ),
              );
            } else {
              CharactersModel character = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://api.genshin.dev/characters/${character.name!.toLowerCase()}/gacha-splash'),
                                fit: BoxFit.cover)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://api.genshin.dev/nations/${character.nation!.toLowerCase()}/icon'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://api.genshin.dev/elements/${character.visionKey!.toLowerCase()}/icon'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            character.name!,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      Text(character.name!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < character.rarity!; i++)
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                        ],
                      ),
                      Text(
                        character.affiliation!,
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          character.description!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      for (int i = 0; i < character.skillTalents!.length; i++)
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(urlImageTalent(
                                          character.name!,
                                          character.skillTalents![i].type!)),
                                      fit: BoxFit.cover),
                                ),
                                width: 75,
                                height: 75,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        character.skillTalents![i].unlock!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        character.skillTalents![i].name!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        character.skillTalents![i].description!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}

String urlImageTalent(String name, String talent) {
  var split = talent.split("_");
  var tipe = split[1];

  if (split[1] == 'ATTACK') {
    tipe = 'na';
  } else {
    tipe = split[1].toLowerCase();
  }

  return "https://api.genshin.dev/characters/${name.toLowerCase()}/talent-$tipe";
}
