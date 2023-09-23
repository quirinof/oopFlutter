import 'package:flutter/material.dart';

var dataObjects = [
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
  {
    "beer name": "La Fin Du Monde",
    "type": "Bock",
    "ibu": "65"
  },
  {
    "beer name": "Sapporo Premiume",
    "type": "Sour Al",
    "ibu": "54"
  },
  {
    "beer name": "Duvel",
    "type": "Pilsner",
    "ibu": "82"
  },
];

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
        appBar: AppBar(
          title: const Text("Cervejas"),
        ),
        body: MyTileWidget(
          objects: dataObjects,
          columnNames: const ["Nome", "Tipo", "iBU"],
          propertyNames: const ["beer name", "type", "ibu"],
        ),
        bottomNavigationBar: NewNavBar()
      )
    );
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cervejas",
        icon: Icon(Icons.local_drink_outlined),
      ),
      BottomNavigationBarItem(
          label: "Café", icon: Icon(Icons.coffee_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  final List objects, columnNames, propertyNames;
  DataBodyWidget({
    this.objects = const [], 
    this.columnNames = const [], 
    this.propertyNames = const []
  });

  @override
  Widget build(BuildContext context) {
  /*
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];
  */
    return SingleChildScrollView(
      child: Center(child: DataTable(
        columns: columnNames.map(
          (name) => DataColumn(
            label: Expanded(
              child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))
            )
          )
        ).toList(),
        rows: objects.map(
          (obj) => DataRow(
            cells: propertyNames.map(
              (propName) => DataCell(Text(obj[propName]))
            ).toList()
          )
        ).toList()
      ))
    );
  }
}

class MyTileWidget extends StatelessWidget {
  final List objects, columnNames, propertyNames;
  MyTileWidget({
    this.objects = const [], 
    this.columnNames = const [], 
    this.propertyNames = const []
  });

  @override
  Widget build(BuildContext context) {
    /*
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["beer name", "type", "ibu"];
    */
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        var object = objects[index];
        return ListTile(
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  propertyNames.length,
                  (i) => Text("${columnNames[i]}: ${object[propertyNames[i]]}")
                )
              )
            ]
          )
        );
      }
    );
  }
}
