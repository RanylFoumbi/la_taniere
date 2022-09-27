// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:la_taniere/models/product.dart';

import '../models/article.dart';
import '../utilities/api_call.dart';
import '../utilities/utilities.dart';

@lazySingleton
class ApiService {
  Future getAppVersion() async {
    String url = Utilities.API_BASE_URL + "/api/v1/version/get";
    var response = await getRequest(url);
    return jsonDecode(response.body);
  }

  Future<List<Article>> getArticles() async {
    String url = Utilities.API_BASE_URL + "/football/article";
    Response response = await getRequest(url);
    List<Article> allArticles = Utilities.makeArticles(response);
    // Filter event by category
    // allEvents = allEvents.where((e) => (e.category == "Week Tips" && e.score != '')).toSet().toList();
    print({"object": allArticles});
    return allArticles;
  }

  Future<List<Product>> getProducts() async {
    String url = Utilities.API_BASE_URL + "/football/product";
    Response response = await getRequest(url);
    print({"toDisplay": response.body});
    List<Product> allProducts = Utilities.makeProducts(response);
    return allProducts;
  }

  Future<List<Article>> getPostAndTweets() async {
    String url = Utilities.API_BASE_URL + "/football/posttweet";
    Response response = await getRequest(url);
    print({"toDisplay": response.body});
    List<Article> allPostAndTweets = Utilities.makeArticles(response);
    print({"allPostAndTweets": allPostAndTweets});
    return allPostAndTweets;
  }
}
