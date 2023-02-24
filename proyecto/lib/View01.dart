import 'package:flutter/material.dart';

import 'SearchView.dart';


void main() {
  runApp(const View01(title: '',));
}

class View01 extends StatefulWidget { // Vista Home de la aplicación

  const View01({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<View01> createState() => _MyHomePageState();  // Creamos un estado (Vista Stateful)
}

class _MyHomePageState extends State<View01> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    void on_search_button_press() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SearchPage()),);
    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
          key: const Key('titulo'),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('ElderlyNator',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
              key: const Key('nombreapp'),

            ),
            const Image(
              image: NetworkImage(
                'https://media.gettyimages.com/vectors/seamless-pattern-with-fruit-vegetable-icons-vector-id1202978781',),
                   height: 250,
                  key: const Key('imageninicio'),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                ),
                onPressed: on_search_button_press,
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('BUSCAR'
                  ),
                ),
     key: const Key('buscarinicio')
            ),
          ],
        ),
      ),
    );
  }

}
