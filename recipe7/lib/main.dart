import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  List<String> columnNames = ["Nome", "Estilo", "IBU"];
  List<String> propertyNames = ["name", "style", "ibu"];
  int sizeSelected = 10;

  void carregar(index) {
    /*  print('carregar #1 - antes de carregarCervejas'); */
    switch (index) {
      case 0:
        columnNames = ["Nome", "Intensificador", "Notas"];
        propertyNames = ["blend_name", "intensifier", "notes"];
        carregarCafes();
        break;
      case 1:
        columnNames = ["Nome", "Estilo", "IBU"];
        propertyNames = ["name", "style", "ibu"];
        carregarCervejas();
        break;
      case 2:
        columnNames = ["Nacão", "Idioma", "Capital"];
        propertyNames = ["nationality", "language", "capital"];
        carregarNacoes();
        break;
    }
    /*  print('carregar #2 - carregarCervejas retornou $res'); */
  }

  Future<void> carregarCafes() async {
    var coffeesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': sizeSelected.toString()},
    );

    print('carregarCafes #1 - antes do await');
    var jsonString = await http.read(coffeesUri);
    print('carregarCafes #2 - depois do await');
    var coffeesJson = jsonDecode(jsonString);

    tableStateNotifier.value = coffeesJson;
  }

  Future<void> carregarCervejas() async {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': sizeSelected.toString()},
    );

    print('carregarCervejas #1 - antes do await');
    var jsonString = await http.read(beersUri);
    print('carregarCervejas #2 - depois do await');
    var beersJson = jsonDecode(jsonString);

    tableStateNotifier.value = beersJson;
  }

  Future<void> carregarNacoes() async {
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': sizeSelected.toString()},
    );

    print('carregarNacoes #1 - antes do await');
    var jsonString = await http.read(nationsUri);
    print('carregarNacoes #2 - depois do await');
    var nationsJson = jsonDecode(jsonString);

    tableStateNotifier.value = nationsJson;
  }
}

final dataService = DataService();

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
          title: const Text("Listas"),
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(Icons.filter_list),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 5,
                  child: Text("Carregar 5 itens"),
                ),
                PopupMenuItem(
                  value: 10,
                  child: Text("Carregar 10 itens"),
                ),
                PopupMenuItem(
                  value: 15,
                  child: Text("Carregar 15 itens"),
                ),
              ],
              onSelected: (value) {
                dataService.sizeSelected = value;
                dataService.carregar;
              },
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            return DataTableWidget(
              jsonObjects: value,
              columnNames: dataService.columnNames,
              propertyNames: dataService.propertyNames,
            );
          },
        ),
        bottomNavigationBar: NewNavBar(
          itemSelectedCallback: dataService.carregar,
        ),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  dynamic itemSelectedCallback;
  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }
  @override
  Widget build(BuildContext context) {
    var state = useState(1);
    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        itemSelectedCallback(index);
      },
      currentIndex: state.value,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        )
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: const TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
