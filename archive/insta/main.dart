import 'package:flutter/material.dart';

import './routes/home.dart';

void main() => runApp(const Instagram());

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      themeMode: ThemeMode.system,
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => const HomePage(),
        '/login': (BuildContext context) => const HomePage(),
        '/signup': (BuildContext context) => const HomePage(),
        '/profile': (BuildContext context) => const HomePage(),
        '/explore': (BuildContext context) => const HomePage(),
        '/messages': (BuildContext context) => const HomePage(),
        '/notifications': (BuildContext context) => const HomePage(),
        '/settings': (BuildContext context) => const HomePage(),
        '/search': (BuildContext context) => const HomePage(),
        '/post': (BuildContext context) => const HomePage(),
        '/post-detail': (BuildContext context) => const HomePage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: Colors.red,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          elevation: 5,
          toolbarTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ).bodyText2,
          titleTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ).headline6,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontFamily: 'OpenSans',
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontFamily: 'Quicksand',
          ),
          bodyText2: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontFamily: 'Quicksand',
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.deepOrange),
      ),
      debugShowCheckedModeBanner: false,
      home: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: ThemeData.dark().primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          print('index: $index');
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.maps_ugc_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.sms),
            onPressed: () {},
          ),
        ],
        title: Text('Instagram', style: Theme.of(context).textTheme.headline1),
      ),
      body: const MainBody(),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
          Divider(height: 30, color: Colors.red, thickness: 1),
          BodyContent(),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: const AssetImage('assets/images/passion.jpg'),
              child: Icon(Icons.add,
                  size: 30, color: Theme.of(context).primaryColor),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
            const CircleAvatar(
              maxRadius: 40,
              minRadius: 10,
              backgroundImage: AssetImage('assets/images/passion.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(
                maxRadius: 20,
                minRadius: 10,
                backgroundImage: AssetImage('assets/images/passion.jpg'),
              ),
              SizedBox(width: 10),
              Text(
                'Passion is the key',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontStyle: FontStyle.italic,
                ),
              ),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          const Divider(height: 10, thickness: 1),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                const Divider(height: 10, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.favorite, color: Colors.red, size: 30),
                    Icon(Icons.comment, color: Colors.blue, size: 30),
                    Icon(Icons.send, color: Colors.green, size: 30),
                    Spacer(),
                    Icon(Icons.bookmark, color: Colors.grey, size: 30),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                const Divider(height: 10, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.favorite, color: Colors.red, size: 30),
                    Icon(Icons.comment, color: Colors.blue, size: 30),
                    Icon(Icons.send, color: Colors.green, size: 30),
                    Spacer(),
                    Icon(Icons.bookmark, color: Colors.grey, size: 30),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
        ],
      ),
    );
  }
}
