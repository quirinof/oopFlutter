//receita 6 que vai tratar da gerência de estado, utilizando a bibilioteca hooks
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  List<String> columnNames = ["Nome", "Estilo", "IBU"];
  List<String> propertyNames = ["name", "style", "ibu"];

  void carregar(index){
    switch(index){
      case 0: 
        columnNames = const ["Nome", "Tipo", "Info"];
        propertyNames = const ["name", "type", "info"];
        loadCoffees();
        break;
      case 1: 
        columnNames = const ["Nome", "Estilo", "IBU"];
        propertyNames = const ["name", "style", "ibu"];
        loadBeers();
        break;
      case 2: 
        columnNames = const ["País", "Clima", "Região"];
        propertyNames = const ["country", "climate", "region"];
        loadNations();
        break;
    }
  }

  void loadCoffees(){
    tableStateNotifier.value = [
      {
      "name": "Cappuccino",
      "type": "Espresso",
      "info": "Amargo/Cremoso"
      },
      {
      "name": "Latte",
      "type": "Espresso",
      "info": "Suave/Cremoso"
      },
      {
      "name": "Mocha",
      "type": "Espresso",
      "info": "Doce"
      }
    ];
  }
  void loadBeers(){
    tableStateNotifier.value = [
      {
      "name": "La Fin Du Monde",
      "style": "Bock",
      "ibu": "65"
      },
      {
      "name": "Sapporo Premiume",
      "style": "Sour Ale",
      "ibu": "54"
      },
      {
      "name": "Duvel", 
      "style": "Pilsner", 
      "ibu": "82"
      }
    ];
  }
  void loadNations(){
    tableStateNotifier.value = [
      {
      "country": "Brasil",
      "climate": "Tropical",
      "region": "América do Sul"
      },
      {
      "country": "Rússia",
      "climate": "Polar",
      "region": "Eurásia"
      },
      {
      "country": "Egito", 
      "climate": "Desértico", 
      "region": "África"
      }
    ];
  }
}
final dataService = DataService();

//var dataObjects = [];


void main() {
  dataService.loadBeers();
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
          title: const Text("Menu"),
        ),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder:(_, value, __){
            return DataTableWidget(
              jsonObjects: value,
              columnNames: dataService.columnNames,
              propertyNames: dataService.propertyNames
            );
          }
        ),
        bottomNavigationBar: NewNavBar(
          itemSelectedCallback: dataService.carregar,
          icons: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined)
          ],
          labels: const [
            "Coffees",
            "Beers",
            "Nations"
          ],
        )
      ));
  }
}

class NewNavBar extends HookWidget {
  List<Icon> icons;
  List<String> labels;
  dynamic itemSelectedCallback;

  NewNavBar({
    this.icons = const [], 
    this.labels = const [], 
    this.itemSelectedCallback
  }){
    itemSelectedCallback ??= (_){};
  }

  @override
  Widget build(BuildContext context) {
    final state = useState(1);
    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        itemSelectedCallback(index);
        //carregarCervejas();
      },
      currentIndex: state.value,
      items: List.generate(
        icons.length, 
        (index) => BottomNavigationBarItem(
          icon: icons[index],
          label: labels[index].toString() // Converti o rótulo para string
        ),
      ),

    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const []
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames.map(
        (name) => DataColumn(
          label: Expanded(
            child: Text(
              name,
              style: const TextStyle(fontStyle: FontStyle.italic)
            )
          )
        )
      ).toList(),
      rows: jsonObjects.map(
        (obj) => DataRow(
          cells: propertyNames.map((
            propName) => DataCell(Text(obj[propName]))
          ).toList()
        )
      ).toList());
  }
}