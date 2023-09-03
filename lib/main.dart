import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.cyan
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Coisas das Marias",
            style: TextStyle(fontSize: 30),
          )
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("just starting...",
              style: TextStyle(
                color: Colors.deepPurple, 
                fontWeight: FontWeight.bold
              )
            ),
            const Text("in middle..."),
            const Text("ending..."),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.network(
                'https://img.freepik.com/vetores-premium/fundo-de-flores-de-sakura-fundo-branco-isolado-da-flor-de-cerejeira_38668-274.jpg?w=996'
              ),
            ),
          ]
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
