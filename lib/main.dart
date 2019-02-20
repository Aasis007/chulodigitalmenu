/// ListTile

import 'package:flutter/material.dart';

void main() {
  runApp(new TileApp());

}

class TileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: Text('Chulo Menu'),
          ),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new StuffInTiles(listOfTiles[index]);
          },
          itemCount: listOfTiles.length,
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          selected: true,
          leading: new Text("1"),
          trailing: new Text("Rs.220",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
          title: new Text(t.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Animals',
    <MyTile>[
      new MyTile('Dogs'),
      new MyTile('Cats'),
      new MyTile('Birds'),
    ],
  ),
  new MyTile(
    'Cars',
    <MyTile>[
      new MyTile('Tesla'),
      new MyTile('Toyota'),
    ],
  ),
  new MyTile(
    'Phones',
    <MyTile>[
      new MyTile('Google'),
      new MyTile('Samsung'),
      new MyTile('OnePlus'),
    ],
  ),
];