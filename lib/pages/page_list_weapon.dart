import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/api_calls/api_genshin.dart';
import 'package:latihan_responsi_praktpm/pages/page_detail_weapon.dart';

class WeaponListPage extends StatefulWidget {
  const WeaponListPage({Key? key}) : super(key: key);

  @override
  State<WeaponListPage> createState() => _WeaponListPageState();
}

class _WeaponListPageState extends State<WeaponListPage> {
  int _listLength = 20;
  late int _totalWeapon;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          if (_listLength < _totalWeapon) {
            if (_listLength + 20 < _totalWeapon) {
              _listLength += 20;
            } else {
              _listLength = _totalWeapon;
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Weapon"),
      ),
      body: Container(
        child: FutureBuilder(
          future: GenshinApi().getWeaponList(),
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
              _totalWeapon = snapshot.data.length;
              if (_listLength > _totalWeapon) {
                _listLength = _totalWeapon;
              }
              return ListView.builder(
                itemCount: _listLength,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WeaponDetailPage(name: snapshot.data[index]),
                            ));
                      },
                      leading: Image.network(
                        'https://api.genshin.dev/weapons/${snapshot.data[index]}/icon',
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
        ),
      ),
    );
  }
}
