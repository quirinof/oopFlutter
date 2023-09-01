import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.cyan),
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Coisas das Marias",
            style: TextStyle(fontSize: 30),
          )
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("just starting...",
              style: TextStyle(
                color: Colors.deepPurple, 
                fontWeight: FontWeight.bold
              )
            ),
            Text("in middle..."),
            Text("ending...")
          ],
        )
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              label: const Text("Menu")
            )
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.list_alt),
              label: const Text("Produtos")
            )
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.card_giftcard),
              label: const Text("Kits presenteáveis")
            )
          )
        ]
      ),
    )
  );

  runApp(app);
}
