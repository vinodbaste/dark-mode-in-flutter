import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DarkThemeNotifier.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Provider.of<DarkThemeNotifier>(context).isDarkMode
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primaryVariant),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Provider.of<DarkThemeNotifier>(context).isDarkMode
                ? Icons.brightness_high
                : Icons.brightness_low),
            onPressed: () {
              changeTheme(
                  Provider.of<DarkThemeNotifier>(context, listen: false).isDarkMode ? false : true,
                  context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  color: Provider.of<DarkThemeNotifier>(context).isDarkMode
                      ? Colors.red
                      : Colors.black87),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void changeTheme(bool set, BuildContext context) {
    ///Call setDarkMode method inside our Settings ChangeNotifier class to
    ///Notify all the listeners of the change.
    Provider.of<DarkThemeNotifier>(context, listen: false).setDarkMode(set);
  }
}