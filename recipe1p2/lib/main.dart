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
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: const[
              DataColumn(
                label: Text("Nome", 
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ),
              DataColumn(
                label: Text("Estilo", 
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ),
              DataColumn(
                label: Text("IBU", 
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              )
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
              ]),
              DataRow(cells: [
                DataCell(Text("Skol")),
                DataCell(Text("American Adjunct Lager")),
                DataCell(Text("8"))
              ]),
              DataRow(cells: [
                DataCell(Text("Brahma")),
                DataCell(Text("Pilsner Lager")),
                DataCell(Text("5"))
              ]),
              DataRow(cells: [
                DataCell(Text("Devassa")),
                DataCell(Text("Various Styles")),
                DataCell(Text("10"))
              ]),
              DataRow(cells: [
                DataCell(Text("Petra")),
                DataCell(Text("Various Styles")),
                DataCell(Text("10"))
              ]),
              DataRow(cells: [
                DataCell(Text("Antarctica")),
                DataCell(Text("Pilsner Lager")),
                DataCell(Text("9"))
              ]),
              DataRow(cells: [
                DataCell(Text("Amstel")),
                DataCell(Text("Lager")),
                DataCell(Text("21"))
              ]),
              DataRow(cells: [
                DataCell(Text("Budweiser")),
                DataCell(Text("Lager")),
                DataCell(Text("12"))
              ]),
              DataRow(cells: [
                DataCell(Text("Heineken")),
                DataCell(Text("Lager")),
                DataCell(Text("19"))
              ]),
              DataRow(cells: [
                DataCell(Text("Kaiser")),
                DataCell(Text("Pilsner Lager")),
                DataCell(Text("10"))
              ]),
              DataRow(cells: [
                DataCell(Text("Glacial")),
                DataCell(Text("Pilsner Lager")),
                DataCell(Text("7"))
              ]),
              DataRow(cells: [
                DataCell(Text("Bohemia")),
                DataCell(Text("Various Styles")),
                DataCell(Text("13"))
              ]),
              DataRow(cells: [
                DataCell(Text("Original")),
                DataCell(Text("Vienna Lager")),
                DataCell(Text("21"))
              ]),
              DataRow(cells: [
                DataCell(Text("Tiger")),
                DataCell(Text("Lager")),
                DataCell(Text("18"))
              ]),
              DataRow(cells: [
                DataCell(Text("Itaipava")),
                DataCell(Text("American Adjunct Lager")),
                DataCell(Text("7"))
              ]),
            ]
          )
        )
      ), 
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