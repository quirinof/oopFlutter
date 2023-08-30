import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Campeonato Brasileiro",
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: const Center(
            child: Column(
          children: [
            Text("Classificação...",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            Text("Partidas..."),
            Text("Noticias...")
          ],
        )),
        bottomNavigationBar: Row(children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.newspaper),
              label: const Text("Notícias")),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              label: const Text("Menu")),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.loop),
              label: const Text("Transferências"))
        ]),
      ));

  runApp(app);
}
