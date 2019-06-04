import 'dart:async';
import 'dart:convert';
import 'package:flutter_app_api_list/config/constants.dart';
import 'package:flutter_app_api_list/domain/post.dart';
import 'package:flutter_app_api_list/domain/user.dart';
import 'package:http/http.dart' as http;

class PostService {

  Future<List<Post>> findAll() async {
    final response = await http.get(Constants.BASE_URL + 'postss');
    final responseJson = json.decode(response.body);
    // usar compute se tiver lento.
    return responseJson.map<Post>((json) => new Post.fromJson(json)).toList();
  }

  Future<User> validarCelular() async {
    final response = await http.post(Constants.PEDIDO + 'v1/public/cliente/pesquisarCelular',
        headers: {"Content-Type": "application/json"},
        body: json.encode({"celular": "1798153535353"}));


    final responseJson = json.decode(response.body);
    return new User.fromJson(responseJson);
  }

//  // A function that will convert a response body into a List<Photo>
//  List<Post> getPosts(String responseBody) {
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//    return parsed.map<Post>((json) => new Post.fromJson(json)).toList();
//  }

}