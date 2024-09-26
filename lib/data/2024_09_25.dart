import 'dart:convert';

import '../models/models.dart';

class Data {
  static List<KColumn> getColumns([String? data]) {
    print("Column Data");
    print('----------------------------------');
    print(data);
    print('----------------------------------');

    // Decode the JSON data
    List<dynamic> jsonData = jsonDecode(data!);

    return jsonData.map((item) {
      print(item['id']);
      print(item['title']);
      print(
          'Number of tasks: ${item['tasks']?.length ?? 0}'); // Check number of tasks

// Fetching tasks for the current column

      return KColumn(
        title: item['title'],
        children: [
          // KTask(title: item['title']),
          KTask(title: 'test purpose')
        ], // Ignoring children as per your requirement
      );
    }).toList();
  }
}
