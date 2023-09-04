import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      fontFamily: 'Ubuntu-Bold',
      primarySwatch: Colors.cyan
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Coisas das Marias",
            style: TextStyle(fontSize: 30)
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
            FadeInImage.assetNetwork(
              width: 200,
              height: 200,
              fadeInDuration: const Duration(seconds: 1),
              fadeOutDuration: const Duration(seconds: 1),
              placeholder: 'assets/images/me.jpeg',
              image: 'https://logospng.org/download/whatsapp/logo-whatsapp-preto-branco-256.png'
            )
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
