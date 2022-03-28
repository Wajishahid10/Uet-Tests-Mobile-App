import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic post(String query, Map data) async {
  String _dataToSend = json.encode(data);

  http.Response response = await http.post(
    Uri.parse(query),
    headers: {"Content-Type": "application/json"},
    body: _dataToSend,
  );

  dynamic recievedData;

  if (response.statusCode == 200) {
    print(response.body);
    recievedData = jsonDecode(response.body);
  } else {
    print(response.statusCode);
  }

  return recievedData;
}

dynamic get(String query) async {
  http.Response response = await http.post(
    Uri.parse(query),
    headers: {"Content-Type": "application/json"},
  );

  dynamic recievedData;

  if (response.statusCode == 200) {
    print(response.body);
    recievedData = jsonDecode(response.body);
  } else {
    print(response.statusCode);
  }

  return recievedData;
}

void signup() {
  Map data = {
    'title': "_title.text",
    'description': "_description.text",
    'type': "_type.text",
  };
  String query = 'https://uet-test.herokuapp.com/api/signup';

  dynamic dataRecieved = post(query, data);
}
