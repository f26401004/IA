import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/GridContainer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _HomeAppBar(),
          GridContainer()
        ]
      )
    )
  }
}

class _HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('IA', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.perm_contact_calendar),
          onPressed: () => Navigator.pushNamed(context, '/collection')
        )
      ],
    );
  }
}