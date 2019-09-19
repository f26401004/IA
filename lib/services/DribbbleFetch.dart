import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../models/PostList.dart';

var uuid = new Uuid();

Future<List<DribbblePost>> fetchPost() async {
  final response = await http.get('https://dribbble.com/');

  if (response.statusCode == 200) {
    final posts = <DribbblePost>[];

    RegExp divExp = RegExp(r'''<div class="dribbble([\w\W]+?)[\/]?/div>''');
    final aMatches = divExp.allMatches(response.body).toList();
    aMatches.asMap().forEach((index, target) {
      DribbblePost post = DribbblePost.transfer(target.group(0));
      posts.add(post);
    });
    return posts;
  } else {
    throw Exception('Failed to fetch the Dribbble posts.');
  }
}

class DribbblePost extends Post {

  DribbblePost(String id, String title, String url, String imgUrl, String type) : super(id, title, url, imgUrl, type);

  factory DribbblePost.transfer(String divString) {
    RegExp aExp = RegExp(r'''<a class="dribbble-link([\w\W]+?)[\/]?/a>''');
    RegExp pExp = RegExp(r'''<p class="shot-title([\w\W]+?)[\/]?/p>''');
    RegExp sourceExp = RegExp(r'''<source ([\w\W]+?)[\/]?/source>''');
    

    RegExp titleExp = RegExp(r'''>([\w\W]+?)[\/]?>''');
    RegExp urlExp = RegExp(r'''href\s*=\s*['"]([^'"]*?)['"][^>]''');
    RegExp imgExp = RegExp(r'''srcset\s*=\s*['"]([^'"]*?)['"][^>]''');
    final title = titleExp.firstMatch(pExp.firstMatch(divString).group(0)).group(0);
    final url = urlExp.firstMatch(aExp.firstMatch(divString).group(0)).group(0);
    final imgUrl = imgExp.firstMatch(sourceExp.firstMatch(divString).group(0)).group(0);

    return DribbblePost(
      uuid.v4(),
      title,
      url,
      imgUrl,
      'dribbble'
    );
  }

}