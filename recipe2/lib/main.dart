import 'package:flutter/material.dart';

class CaixaDeIcones extends StatelessWidget {

  CaixaDeIcones();

}
void main() {

  MaterialApp app = MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      home: Scaffold(

        appBar: AppBar(title: const Text("Dicas")),

        body: const Column(children: [

          Expanded(

            child: Text("La Fin Du Monde - Bock - 65 ibu"),

          ),

          Expanded(

            child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),

          ),

          Expanded(

            child: Text("Duvel - Pilsner - 82 ibu"),

          )

        ]),

        bottomNavigationBar: CaixaDeIcones()),

      ));

  runApp(app);

}