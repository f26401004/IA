import 'package:flutter/cupertino.dart';
import '../models/PostList.dart';

class GridContainer extends StatelessWidget {
  final List<Post> posts;
  GridContainer({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: posts.map((post) => Container(
        padding: const EdgeInsets.all(8),
        child: GridItem(post: post),
      )).toList(),
    );
  }
}


class GridItem extends StatefulWidget {
  final Post post;
  GridItem({Key key, @required this.post}) : super(key: key);

  @override
  _GridItemState createState() => _GridItemState(post);
}

class _GridItemState extends State<GridItem> {
  Post post;
  _GridItemState(Post target) {
    post = target;
  }

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(this.post.getImgUrl()),
          fit: BoxFit.cover
        ),
      ),
      alignment: Alignment.center,
    );
  }
}