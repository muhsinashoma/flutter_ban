import 'dart:convert';

import '../models/models.dart';

class Data {
  static List<KColumn> getColumns([String? data]) {
    print("SDfsdfsdfsdf");
    print(data);

    List<dynamic> jsonData = jsonDecode(data!);

    return jsonData.map((item) {
      print(item['title']);
      return KColumn(
        title: item['title'],
        children: [
          KTask(title: 'ToDo 1'),
        ], // Ignoring children as per your requirement
      );
    }).toList();
    // return List.from([
    //   KColumn(
    //     title: 'To Do',
    //     children: [
    //       KTask(title: 'ToDo 1'),
    //       KTask(title: 'ToDo 2'),
    //     ],
    //   ),

    //   KColumn(
    //     title: 'In Progress',
    //     children: [
    //       KTask(title: 'ToDo 3'),
    //     ],
    //   ),

    //   // KColumn(title: 'QA',
    //   // children: [
    //   //    KTask(title: 'QA test 1'),
    //   // ]),

    //   // KColumn(
    //   //   title: 'Done',
    //   //   children: [
    //   //     KTask(title: 'ToDo 4'),
    //   //     KTask(title: 'ToDo 5'),
    //   //   ],
    //   // )
    // ]);
  }
}
