import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';
class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var popUpState = useState(dataService.numberOfItems);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
          actions: [
            SearchBar(
              leading: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              constraints: const BoxConstraints(
                minWidth: 1.0,
                maxWidth: 300.0,
              ),
              onChanged: (filter) {
                if (filter.length >= 3) {
                  dataService.emitirEstadoFiltrado(filter);
                }
                else {
                  dataService.emitirEstadoFiltrado('');
                }
              },
            ),
            PopupMenuButton(
              initialValue: popUpState.value,
              itemBuilder: (_) => dataService.possibleNumbers.map(
                (num) => PopupMenuItem(
                  value: num,
                  child: Text("Carregar $num itens por vez"),
                )
              ).toList(),
              onSelected: (number) {
                dataService.numberOfItems = number;
                popUpState.value = dataService.numberOfItems;
              },
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            switch (value['status']) {
              case TableStatus.idle:
                return Center(child: Text("Toque em algum botão"));

              case TableStatus.loading:
                return Center(child: CircularProgressIndicator());

              case TableStatus.ready:
                return InteractiveViewer(
                  constrained: false,
                  child: DataTableWidget(
                    jsonObjects: dataService.filtrarObjetos(),
                    propertyNames: value['propertyNames'],
                    columnNames: value['columnNames'],
                    sortCallback: dataService.ordenarEstadoAtual
                  ),
                );

              case TableStatus.error:
                return Text("Lascou");
            }

            return Text("...");
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
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        _itemSelectedCallback(index);
      },
      currentIndex: state.value,
      items: const [
        BottomNavigationBarItem(
          label: "Restaurantes",
          icon: Icon(Icons.food_bank_outlined),
        ),
        BottomNavigationBarItem(
          label: "Comidas",
          icon: Icon(Icons.restaurant_outlined),
        ),
        BottomNavigationBarItem(
          label: "Sobremesas",
          icon: Icon(Icons.cake_outlined),
        )
      ],
    );
  }
}

class DataTableWidget extends HookWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  final _sortCallback;

  DataTableWidget({
    this.jsonObjects = const [], 
    this.columnNames = const [], 
    this.propertyNames= const [], sortCallback
  }) : _sortCallback = sortCallback ?? (String, bool){}

  @override
  Widget build(BuildContext context) {
    var isAscending = useState(false);
    var sortedColumn = useState(0);
    return DataTable(
      sortAscending: isAscending.value,
      sortColumnIndex: sortedColumn.value,
      columns: columnNames.map(
        (name) => DataColumn(
          onSort: (columnIndex, ascending) {
            _sortCallback(propertyNames[columnIndex], ascending);
            sortedColumn.value = columnIndex;
            isAscending.value = ascending;
          },
          label: Expanded(
            child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
          )
        )
      ).toList(),
      rows: jsonObjects.map(
        (obj) => DataRow(
          cells: propertyNames.map(
            (propName) => DataCell(Text(obj[propName]))
          ).toList()
        )
      ).toList()
    );
  }
}