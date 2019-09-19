import 'package:flutter/foundation.dart';
import '../models/PostList.dart';

class CollectionListModel extends ChangeNotifier {
  final PostListModel _postModel;
  // store id only for small memory space.
  final List<String> _posts;

  CollectionListModel(this._postModel, CollectionListModel previous)
    : assert(_postModel != null),
    _posts = previous?._posts ?? [];
  
  // map the post from _postModel
  List<Post> get posts => _posts.map((id) => _postModel.getById(id)).toList();

  void add(Post post) {
    // add id only
    _posts.add(post.id);
    // notify the model to rebuild the widgets dependent on itself
    notifyListeners();
  }
} 