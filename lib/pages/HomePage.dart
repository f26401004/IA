import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia/models/PostList.dart';
import 'package:provider/provider.dart';
import '../components/GridContainer.dart';
import '../components/HomeAppBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postListModel = Provider.of<PostListModel>(context);
    return Container(
      child: DefaultTabController(
        length: postListModel.getTypes().length,
        child: Scaffold(
          appBar: HomeAppBar(),
          body:  postListModel.status ? TabBarView(
            children: postListModel.getTypes().map((target) => GridContainer(posts: postListModel.getByType(target))).toList()
          ) : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
