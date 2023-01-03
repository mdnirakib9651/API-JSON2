import 'dart:convert';

import '../Model/comment.dart';
import 'package:http/http.dart' as http;
import '../Model/photo_model.dart';
import '../Model/post_model.dart';

class Photo_Repository{

  // Multi Photo Model
  Future<List<PostModel>> getPostListData(context) async {
    PostModel? result;
    List<PostModel> postList=[];
    try {
      var url =
      Uri.https('jsonplaceholder.typicode.com', '/posts');

      var res= await http.get(url);
      if (res.statusCode == 200) {
        var item = json.decode(res.body);
        //  result = PostModel.fromJson(item);

        for( var json in item){
          PostModel post=  PostModel(
            userId: json['userId'],
            id: json['id'],
            title: json['title'] ?? "",
            body: json['body'] ?? "",
          );
          postList.add(post);
        }
      } else {
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }
    return postList;
  }

  Future<List<PhotoModel>> getPhotoListData(context) async {
    PhotoModel? result;
    List<PhotoModel> photoList=[];
    try {
      var url =
      Uri.https('jsonplaceholder.typicode.com', '/photos');

      var res= await http.get(url);
      if (res.statusCode == 200) {
        var item = json.decode(res.body);
        //  result = PostModel.fromJson(item);

        for( var json in item){
          PhotoModel photo=  PhotoModel(
            albumId : json['albumId'],
            id : json['id'],
            title : json['title'] ?? "",
            url : json['url'],
            thumbnailUrl : json['thumbnailUrl'],
          );
          photoList.add(photo);
        }
      } else {
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }
    return photoList;
  }

  Future<List<CommentModel>> getCommentListData(context) async {
    CommentModel? result;
    List<CommentModel> commentList=[];
    try {
      var url =
      Uri.https('jsonplaceholder.typicode.com', '/comments');

      var res= await http.get(url);
      if (res.statusCode == 200) {
        var item = json.decode(res.body);
        //  result = PostModel.fromJson(item);

        for( var json in item){
          CommentModel photo=  CommentModel(
            postId : json['postId'],
            id : json['id'],
            name : json['name'],
            email : json['email'] ?? "",
            body : json['body'] ?? "",
          );
          commentList.add(photo);
        }
      } else {
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }
    return commentList;
  }

}