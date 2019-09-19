import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../models/PostList.dart';

var uuid = new Uuid();

Future<List<PinterestPost>> fetchPost() async {
  final response = await http.get('https://www.pinterest.com/');

  // grab the information if the status code equal to 200
  if (response.statusCode == 200) {
    final posts = <PinterestPost>[];
    // use regular expression to select the matched string
    RegExp imgExp = new RegExp(r'''<img([\w\W]+?)[\/]?>''');
    RegExp aExp = new RegExp(r'''<a([\w\W]+?)[\/]?/a>''');
    final imgMatches = imgExp.allMatches(response.body).toList();
    final aMatches = aExp.allMatches(response.body).toList();
    imgMatches.asMap().forEach((index, target) {
      // use factory to generate the PinterestPost data
      PinterestPost post = PinterestPost.transfer(target.group(0), aMatches[index].group(0));
      posts.add(post);
    });
    return posts;
  } else {
    throw Exception('Failed to fetch the Pinterest posts.');
  }
}

class PinterestPost extends Post {

  PinterestPost(String id, String title, String url, String imgUrl, String type) : super(id, title, url, imgUrl, type);

  factory PinterestPost.transfer(String imgString, String aString) {
    // use regular expression to get the title, image url and url string
    RegExp titleExp = new RegExp(r'''alt\s*=\s*['"]([^'"]*?)['"][^>]''');
    RegExp imgUrlExp = new RegExp(r'''src\s*=\s*['"]([^'"]*?)['"][^>]''');
    RegExp urlExp = new RegExp(r'''href\s*=\s*['"]([^'"]*?)['"][^>]''');
    final title = titleExp.firstMatch(imgString).group(0);
    final url = urlExp.firstMatch(aString).group(0);
    final imgUrl = imgUrlExp.firstMatch(imgString).group(0);

    return PinterestPost(
      uuid.v4(),
      title,
      url,
      imgUrl,
      'pinterest'
    );
  }
}
