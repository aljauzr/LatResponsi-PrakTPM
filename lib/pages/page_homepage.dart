import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/pages/page_detail_character.dart';
import 'package:latihan_responsi_praktpm/pages/page_detail_weapon.dart';
import 'package:latihan_responsi_praktpm/pages/page_list_character.dart';
import 'package:latihan_responsi_praktpm/pages/page_list_weapon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _lastOpen;
  String? _code;

  Future<void> _getLastOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastOpen = prefs.getString("last_open");
      _code = prefs.getString("code");
    });
  }

  @override
  void initState() {
    super.initState();
    _lastOpen = "";
    _code = "";
    _getLastOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://4.bp.blogspot.com/-iz7Z_jLPL6E/XQ8eHVZTlnI/AAAAAAAAHtA/rDn9sYH174ovD4rbxsC8RSBeanFvfy75QCKgBGAs/w1440-h2560-c/genshin-impact-characters-uhdpaper.com-4K-2.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/en/thumb/5/5d/Genshin_Impact_logo.svg/2560px-Genshin_Impact_logo.svg.png",
                  fit: BoxFit.contain,
                ),
              ),
              if (_lastOpen != null && _lastOpen != "")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Card(
                    child: ListTile(
                      onTap: () async {
                        if (_code == "characters") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CharacterDetailPage(name: _lastOpen!),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WeaponDetailPage(
                                      name: _lastOpen!,
                                    ),
                              ));
                        }
                      },
                      leading: Image.network(
                          'https://api.genshin.dev/${_code}/${_lastOpen!
                              .toLowerCase()}/icon'
                      ),
                      title: Text(_lastOpen.toString().toUpperCase()),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterListPage(),
                              ));
                          _getLastOpen();
                        },
                        child: Text("Character")
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeaponListPage(),
                              ));
                          _getLastOpen();
                        },
                        child: Text("Weapon")
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]
      ),
    );
  }
}
