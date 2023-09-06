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
            "Cervejas",
            style: TextStyle(fontSize: 30)
          )
        ),
      ),
      body: Center(child: DataTable(
        columns: const[
          DataColumn(label: Text("Nome")),
          DataColumn(label: Text("Estilo")),
          DataColumn(label: Text("IBU"))
        ], 
        rows: const[
          DataRow(cells: [
            DataCell(Text("La Fin Du Monde")),
            DataCell(Text("Bock")),
            DataCell(Text("65"))
          ]),
          DataRow(cells: [
            DataCell(Text("Sapporo Premium")),
            DataCell(Text("Sour Ale")),
            DataCell(Text("54"))
          ]),
          DataRow(cells: [
            DataCell(Text("Duvel")),
            DataCell(Text("Pilsner")),
            DataCell(Text("82"))
          ])
        ]
      )),
      bottomNavigationBar: Row(
        children: [
          Expanded(child: ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.menu), 
            label: Text("Menu")
          )),
          Expanded(child: ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.list_alt), 
            label: Text("Prateleiras")
          )),
          Expanded(child: ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.local_drink), 
            label: Text("Outros")
          ))
        ]
      )
    ),
  );

  runApp(app);
}
