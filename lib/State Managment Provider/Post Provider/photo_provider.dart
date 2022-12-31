import 'package:flutter/foundation.dart';

import '../Model/comment.dart';
import '../Model/photo_model.dart';
import '../Model/post_model.dart';
import '../Repository/photo_repository.dart';


class PhotoProvider with ChangeNotifier{

  Photo_Repository photo_repository = Photo_Repository();

  bool loading = false;

  // Post List..
  List<PostModel>? _postList;
  List<PostModel>? get postMdlList=>_postList;
  getPostListData(context) async {
    loading = true;
    _postList = await photo_repository!.getPostListData(context);
    loading = false;
    notifyListeners();
  }

  // Photo List..
  List<PhotoModel>? _photoList;
  List<PhotoModel>? get photoMdlList=>_photoList;
  getPhotoListData(context) async {
    loading = true;
    _photoList = await photo_repository!.getPhotoListData(context);
    loading = false;
    notifyListeners();
  }

  //Comment List..
  List<CommentModel>? _commentList;
  List<CommentModel>? get commentMdlList=>_commentList;
  getCommentListData(context) async {
    loading = true;
    _commentList = await photo_repository!.getCommentListData(context);
    loading = false;
    notifyListeners();
  }
}