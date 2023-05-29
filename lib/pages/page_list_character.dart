import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/api_calls/api_genshin.dart';
import 'package:latihan_responsi_praktpm/pages/page_detail_character.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Karakter"),
      ),
      body: Container(
          child: FutureBuilder(
            future: GenshinApi().getCharacterList(),
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
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailPage(
                                    name: snapshot.data[index].toLowerCase()),
                              ));
                        },
                        leading: Image.network(
                          'https://api.genshin.dev/characters/${snapshot.data[index]}/icon',
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                        ),
                        title: Text(snapshot.data[index].toUpperCase()),
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
