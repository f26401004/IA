import '../services/PinterestFetch.dart' as pinterest;
import '../services/DribbbleFetch.dart' as dribbble;

class PostListModel {
  List<String> _types = [
    'pinterest',
    'dribbble'
  ];

  bool status = false;

  List<Post> _posts;

  Future<void> fetchData() async {
    List<Post> pinterestPosts = await pinterest.fetchPost();
    List<Post> dribbblePosts = await dribbble.fetchPost();

    _posts = []..addAll(pinterestPosts)..addAll(dribbblePosts);
    status = true;
  }

  Post getById(String id) => this._posts.firstWhere((post) => post.getId() == id, orElse: () => null);
  List<String> getTypes() => this._types;
  
  List<Post> getByType(String type) {
    // check the type of the post.
    if (_types.indexOf(type) == -1) {
      throw Exception('Unsupport type of the post.');
    }
    return this._posts.where((post) => post.getType() == type);
  }
}

class Post {
  String id; // the id of the post.
  String title; // the title of the post.
  String url; // the url of the post.
  String imgUrl; // the image url of the post.
  String type; // the type of the post.

  Post(String id, String title, String url, String imgUrl, String type) {
    this.id = id;
    this.title = title;
    this.url = url;
    this.imgUrl = imgUrl;
    this.type = type;
  }

  String getId() => this.id;
  String getTitle() => this.title;
  String getUrl() => this.url;
  String getImgUrl() => this.imgUrl;
  String getType() => this.type;
}

