import 'package:flutter/cupertino.dart';
import '../models/PostList.dart';

class GridContainer extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    // TODO: initialize the data with GridItem
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: <Widget>[
        Container(

        )
      ],
    );
  }
}



class GridItem extends StatefulWidget {
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  Post post;

  @override
  void initState(Post target) {
    super.initState();
    post = target;
  }

  @override
  Widget build (BuildContext context) {

  }
}