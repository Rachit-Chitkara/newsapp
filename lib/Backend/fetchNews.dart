import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newz/Utils/key.dart';
import 'package:newz/Components/searchbar.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=' +
            APIKey.apikey +
            '&q=' +
            searchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');
  return (result['articles']);
}
