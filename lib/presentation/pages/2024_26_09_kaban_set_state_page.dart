//import 'dart:convert';

import 'dart:convert';

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
  /* To show Column Data */

  List<KColumn> columns = [];

  getColumnData() async {
    try {
      final dio = Dio();
      var response =
          await dio.get("http://192.168.35.205/API/get_column_data.php");

      //print('--------------------Column Data-----------------------------');
      //print(response.data);

      // var columnDataValue = response.data;

      //print(columnDataValue);

      //  print('--------------------Column Data-----------------------------');
      columns = Data.getColumns(response.data);

      //print(columns);

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getColumnData();
    getTaskData();
  }

  /* To show Task Data */

  // getTaskData() async {
  //   try {
  //     final dio = Dio();

  //     var response =
  //         await dio.get("http://192.168.35.205/API/get_task_data.php");

  //     if (response.statusCode == 200) {
  //       var task_data = response.data['task_boards'] as List;

  //       //  print(task_data);

  //       // print('---------------------Task Data-----------------------------');
  //       for (var board in task_data) {
  //         var tasks = board['tasks'] as List;
  //         for (var task in tasks) {
  //           task;

  //           print(task);

  //           print(task['title']);

  //           print(task['created_by']);
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  getTaskData() async {
    try {
      final dio = Dio();
      var response =
          await dio.get("http://192.168.35.205/API/get_task_data.php");

      if (response.statusCode == 200) {
        var taskData = response.data['task_boards'] as List;

        // Collect tasks for columns
        List<Map<String, dynamic>> tasksForColumns = [];

        for (var board in taskData) {
          var tasks = board['tasks'] as List;
          for (var task in tasks) {
            tasksForColumns.add({
              'id': task['id'],
              'title': task['title'],
              'tasks': tasks
                  .map((task) => {'id': task['id'], 'title': task['title']})
                  .toList()
              // Add more fields if necessary
            });
          }
        }

        print('--------------task under column-----------------');
        // Convert collected tasks to columns
        var finalData = Data.getColumns(jsonEncode(tasksForColumns));
        //   print("finalData");
        // print(finalData);
        columns = finalData;
        setState(() {});
        //return finalData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  // getTaskData() async {
  //   try {
  //     final dio = Dio();
  //     var response =
  //         await dio.get("http://192.168.35.205/API/get_task_data.php");

  //     if (response.statusCode == 200) {
  //       var taskData = response.data['task_boards'] as List;

  //       // Collect tasks for columns
  //       List<Map<String, dynamic>> columnsData = [];

  //       for (var board in taskData) {
  //         var tasks = board['tasks'] as List;
  //         columnsData.add({
  //           'id': board['id'],
  //           'title': board['title'],
  //           'tasks': tasks
  //               .map((task) => {'id': task['id'], 'title': task['title']})
  //               .toList()
  //         });
  //       }

  //       print('--------------task under column-----------------');
  //       // Convert collected tasks to columns
  //       return Data.getColumns(jsonEncode(columnsData));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return [];
  // }

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

    var url = Uri.parse("http://192.168.35.205/API/column_add.php");
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

    // var url = Uri.parse("http://192.168.33.62/API/task_add.php");

    var url = Uri.parse("192.168.35.205/API/task_add.php");

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
