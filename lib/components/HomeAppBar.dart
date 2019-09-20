import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('IA', style: Theme.of(context).textTheme.display4),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.perm_contact_calendar),
          onPressed: () => Navigator.pushNamed(context, '/collection')
        )
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}