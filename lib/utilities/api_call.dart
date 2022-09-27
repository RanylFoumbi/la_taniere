import 'package:http/http.dart' as http;

// Get Requests
Future<http.Response> getRequest(String url) async {
  var response = await http.get(Uri.parse(url));
  print({"res": response});
  return response;
}

// Post Requests
Future<http.Response> postRequest(String url, Object body) async {
  var response = await http.post(Uri.parse(url), body: body);
  return response;
}