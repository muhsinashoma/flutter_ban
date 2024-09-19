// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http/io_client.dart';

// class HttpClientWithSelfSignedCert extends http.BaseClient {
//   final http.Client _inner = http.Client();

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) {
//     return _inner.send(request);
//   }

//   @override
//   Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
//     HttpClient client = HttpClient()
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//     return http.IOClient(client).get(url, headers: headers);
//   }
// }
