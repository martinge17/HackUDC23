import 'package:flutter/material.dart';
import 'Resultados.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Search Page",
      home: SearchPage(),
    );
  }
}
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() =>
      _SearchPageState();
}
class _SearchPageState extends State<SearchPage>{
  TextEditingController query = TextEditingController();
  Widget _buildAlertDialog(BuildContext context, String e) {
    return AlertDialog(
      title: const Text(
          'Error filling the fields\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decorationStyle: TextDecorationStyle.wavy,
          )
      ),
      content: Text(e),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
            key: const Key('botonalertasearch')
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Search View'),
            backgroundColor: Colors.red,

        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Introduce el texto que quieras buscar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                    controller: query,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none
                      ),

                      hintText: "A coruña",
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.deepPurple,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.purple)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white24),
                    ),
                    onPressed: () {
                      bool error = false;
                      String aux = query.text;
                      if(aux.isEmpty){
                        error = true;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildAlertDialog(context, "El campo de búsqueda no puede estar vacío.\n"
                                  "Introduzca al menos una palabra.");
                            }
                        );
                      }
                      if(!error) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                  Resultados(query: aux,)));
                        setState(() {
                          query.clear();
                        });
                      }
                    },
                    child: const Text("Buscar")
                 ),

              ],
            )
        )
    );
  }


}