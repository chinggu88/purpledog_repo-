import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:purpledog_repo/model/item.dart';

class itemlist {
  Future<RxList<int>> fetchlist(String type) async {
    RxList<int> result = <int>[].obs;
    try {
      var uri = Uri.https('hacker-news.firebaseio.com', '/v0/${type}.json',
          {"print": "pretty"});
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        List temp = json.decode(response.body).toList();
        //오름차순으로 정렬 후 -> 내림차순 정렬
        temp.sort();
        temp = temp.reversed.toList();

        for (int i = 0; i < temp.length; i++) {
          result.add(temp[i]);
        }
        return result;
      } else {
        //200이외의 코드 처리
        return result;
      }
    } catch (e) {
      return result;
    }

    return result;
  }

  Future<Map<String, dynamic>?> fetchlistDetail(String type) async {
    Map<String, dynamic>? result = null;

    var uri = Uri.https('hacker-news.firebaseio.com', '/v0/item/${type}.json',
        {"print": "pretty"});
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> item = jsonDecode(response.body);
      result = item;

      return result;
    } else {
      //200이외의 코드 처리
      return result;
    }
    return result;
  }
}
