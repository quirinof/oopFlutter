import 'package:flutter/material.dart';

class TitAppBar extends StatelessWidget {
  TitAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Dicas")
    );
  }
}
class ColumnsBody extends StatelessWidget {
  ColumnsBody();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
        child: Text("La Fin Du Monde | Bock | 65 ibu"),
      ),
      Expanded(
        child: Text("Sapporo Premiume | Sour Ale | 54 ibu"),
      ),
      Expanded(
        child: Text("Duvel | Pilsner | 82 ibu")
      )
    ]);
  }
}

class NavBar extends StatelessWidget {
  NavBar();

  void touchedButton(int index) {
    print("botao $index tocado");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: touchedButton, 
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas", 
          icon: Icon(Icons.local_drink_outlined)),
        BottomNavigationBarItem(
          label: "Nações", 
          icon: Icon(Icons.flag_outlined))
      ]
    );
  }
}

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Dicas")
      ),
      body: ColumnsBody(),
      bottomNavigationBar: NavBar()
    )
  );
  runApp(app);
}
