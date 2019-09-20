import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './common/theme.dart';

import './models/PostList.dart';
import './models/CollectionList.dart';

import './pages/HomePage.dart';
import './pages/CollectionPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PostListModel>(builder: (context) {
          PostListModel model = PostListModel();
          model.fetchData();
          return model;
        }),
        ChangeNotifierProxyProvider<PostListModel, CollectionListModel>(
          builder: (context, post, previousCollection) => 
            CollectionListModel(post, previousCollection), initialBuilder: (BuildContext context) {},
        )
      ],
      child: MaterialApp(
        title: 'IA',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/collection': (context) => CollectionPage()
        },
      ),
    );
  }
}
