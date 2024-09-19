import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/data.dart';
import '../../models/models.dart';
import '../widgets/kanban_board.dart';
import 'kanban_board_controller.dart';

class KanbanSetStatePage extends StatefulWidget {
  const KanbanSetStatePage({super.key});

  @override
  _KanbanSetStatePageState createState() => _KanbanSetStatePageState();
}

class _KanbanSetStatePageState extends State<KanbanSetStatePage>
    implements KanbanBoardController {
  //TextEditingController controllerTitle = TextEditingController();

  List<KColumn> columns = [];

  getColumnData() async {
    try {
      final dio = Dio();
      var response =
          await dio.get("http://192.168.33.62/API/get_column_data.php");
      // print(response.data);
      columns = Data.getColumns(response.data);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getColumnData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State------------test-----'),
      ),
      body: SafeArea(
        child: KanbanBoard(
          columns: columns,
          controller: this,
        ),
      ),
    );
  }

  @override
  void deleteItem(int columnIndex, KTask task) {
    setState(() {
      columns[columnIndex].children.remove(task);
    });
  }

  @override
  void handleReOrder(int oldIndex, int newIndex, int index) {
    setState(() {
      if (oldIndex != newIndex) {
        final task = columns[index].children[oldIndex];
        columns[index].children.remove(task);
        columns[index].children.insert(newIndex, task);
      }
    });
  }

  @override
  void addColumn(String title) {
    setState(() {
      columns.add(KColumn(
        title: title,
        children: List.of([]),
      ));
    });

    print('-------------------');
    var url = Uri.parse("http://192.168.33.62/API/column_add.php");
    print(url);

    http.post(url, body: {
      "title": title,
    });
  }

  @override
  void addTask(String title, int column) {
    setState(() {
      columns[column].children.add(KTask(title: title));
    });

    var url = Uri.parse("http://192.168.33.62/API/task_add.php");
    print(url);
    http.post(url, body: {
      "title": title,
    });
  }

  @override
  void dragHandler(KData data, int index) {
    setState(() {
      columns[data.from].children.remove(data.task);
      columns[index].children.add(data.task);
    });
  }
}
