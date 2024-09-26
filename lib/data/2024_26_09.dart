import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';

class Data {
  static List<KColumn> getColumns([String? data]) {
    // Decode the JSON data
    List<dynamic> jsonData = jsonDecode(data!);

    return jsonData.map((item) {
      print(item['id']);
      print(item['title']);
      // print(item['tasks']); // Check number of tasks

      // Fetching tasks for the current column
      List<KTask> tasks = [];
      if (item['tasks'] != null) {
        tasks = (item['tasks'] as List).map((task) {
          return KTask(title: task['title']);
        }).toList();
      }

      // Print tasks to debug
      // tasks.forEach((task) {
      //   print('Mapped Task Title: ${task.title}');
      // });

      // print("------------------tasks");
      // print(tasks);

      return KColumn(
        title: item['title'],
        children: tasks,
      );
    }).toList();
  }
}

// class Data {
//   static List<KColumn> getColumns([String? data]) {
//     // print("Column Data");
//     // print('----------------------------------');
//     // print(data);
//     // print('----------------------------------');

//     // Decode the JSON data
//     List<dynamic> jsonData = jsonDecode(data!);

//     return jsonData.map((item) {
//       print(item['id']);
//       print(item['title']);

//       print(
//           'Number of tasks: ${item['tasks']?.length ?? 0}'); // Check number of tasks

//       // Fetching tasks for the current column
      // return KColumn(
      //   title: item['title'],
      //   children: [
      //     // KTask(title: item['title']),
      //     KTask(title: 'test purpose')
      //   ], // Ignoring children as per your requirement
      // );


//     }).toList();
//   }
// }
