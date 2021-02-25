import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_water_reminder/src/global_blocs/auth/auth.dart';

class AnonymousSignInButton extends StatelessWidget {
  const AnonymousSignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return ButtonTheme(
      minWidth: 224,
      height: 48,
      child: RaisedButton(
        onPressed: auth.signInAnonymously,
        color: Theme.of(context).cardColor,
        child: Text('Anonymous Sign in'),
      ),
    );
  }
}