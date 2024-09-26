import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';

class Data {
  static List<KColumn> getColumns([String? data]) {
    // Decode the JSON data
    List<dynamic> jsonData = jsonDecode(data!);

    return jsonData.map((item) {
      // Fetching tasks for the current column
      List<KTask> tasks = [];
      if (item['tasks'] != null) {
        tasks = (item['tasks'] as List).map((task) {
          return KTask(title: task['title']);
        }).toList();
      }
      return KColumn(
        title: item['title'],
        children: tasks,
      );
    }).toList();
  }
}
