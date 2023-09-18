import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBarWidget(
          tit: "Cervejas",
          settingsMenu: const [
            "Azul",
            "Verde",
            "Vermelho"
          ]
        ),
        body: DataBodyWidget(objects: const [
          "La Fin Du Monde | Bock | 65 ibu",
          "Sapporo Premiume | Sour Ale | 54 ibu",
          "Duvel | Pilsner | 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(
          icons: const[
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined)
          ]
        ) 
      )
    );
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({this.icons = const[]});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado, 
      items: icons.map(
        (icn) => BottomNavigationBarItem(
          label: "name",
          icon: icn
        )
      ).toList()
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;
  DataBodyWidget({this.objects = const[]});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects.map(
        (obj) => Expanded(child: Center(child: Text(obj)))
      ).toList()
    );
  }
}

class MainAppBarWidget extends AppBar {
  String tit;
  List<String> settingsMenu;
  MainAppBarWidget({this.tit = "", this.settingsMenu = const []})
  :super(
    title: Text(tit),
    actions: <Widget>[
      PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => settingsMenu.map(
          (its) => PopupMenuItem<String>(child: Text(its)),
        ).toList()
      )
    ],
  );
}
