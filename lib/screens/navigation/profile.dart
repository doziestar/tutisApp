import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.jpeg'),
              ),
              const SizedBox(height: 10),
              Text(
                'Femi Olaoluwa',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.mailBulk,
                      color: Theme.of(context).iconTheme.color),
                  const SizedBox(width: 10),
                  Text(
                    'chidosiky2015@gmail.com',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                child: Text('Authenticate For Registration',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
