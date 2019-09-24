import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:smartmeat/API/post_smartmeat.dart';
import 'dart:io';

String url = '';

// Future<List<PostSmartMeat>> getAllPosts() async {
//   final response = await http.get(url);
//   print(response.body);
//   return allPostsFromJson(response.body);
// }

Future<PostSmartMeat> getPost() async{
  final response = await http.get('$url/1');
  return postSmartMeatFromJson(response.body);
}

Future<http.Response> createPost(PostSmartMeat post) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postSmartMeatToJson(post)
  );
  return response;
}