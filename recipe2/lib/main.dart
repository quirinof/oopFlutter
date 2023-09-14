import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(title: const Text("Dicas")),
        body: ColumnsBody(),
        bottomNavigationBar: NavBar(icons: const[
          Icon(Icons.coffee_outlined),
          Icon(Icons.local_drink_outlined),
          Icon(Icons.flag_outlined)
        ])
      )
    );
  }
}

/*
class TitAppBar extends StatelessWidget {
  TitAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text("Dicas"));
  }
}
*/
class ColumnsBody extends StatelessWidget {
  ColumnsBody();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
        child: Center(child: Text("La Fin Du Monde | Bock | 65 ibu")),
      ),
      Expanded(
        child: Center(child: Text("Sapporo Premiume | Sour Ale | 54 ibu")),
      ),
      Expanded(
        child: Center(child: Text("Duvel | Pilsner | 82 ibu")))
    ]);
  }
}

class NavBar extends StatelessWidget {
  List<Icon> icons;
  NavBar({this.icons = const []});

  void touchedButton(int index) {
    print("botao $index tocado");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: touchedButton,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: icons[index],
          label: 'name $index' // Pode personalizar os rótulos conforme necessário
        )
      )
    );
  }
}
