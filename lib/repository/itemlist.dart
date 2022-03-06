import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:purpledog_repo/model/item.dart';

class itemlist {
  Future<RxList<int>> fetchlist(String type) async {
    RxList<int> result = <int>[].obs;
    var uri = Uri.https(
        'hacker-news.firebaseio.com', '/v0/${type}.json', {"print": "pretty"});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var temp = json.decode(response.body).toList();
      // var temp = response.data.toList();
      for (int i = 0; i < temp.length; i++) {
        result.add(temp[i]);
      }
      result.sort();
      return result;
    }
    return result;
  }

  Future<dynamic> fetchlistDetail(String type) async {
    dynamic? result = null;

    var uri = Uri.https('hacker-news.firebaseio.com', '/v0/item/${type}.json',
        {"print": "pretty"});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> item = jsonDecode(response.body);
      var temp;
      switch (item['type'].toString()) {
        case 'comment':
          temp = detail_comment.fromJson(jsonDecode(response.body));
          break;
        case 'story':
          temp = detail_story.fromJson(jsonDecode(response.body));
          break;
        case 'job':
          temp = detail_job.fromJson(jsonDecode(response.body));
          break;
        case 'poll':
          temp = detail_poll.fromJson(jsonDecode(response.body));
          break;
        case 'pollopt':
          temp = detail_pollopt.fromJson(jsonDecode(response.body));
          break;
      }
      print(temp.type);
      return result;
    }
    return result;
  }
}
