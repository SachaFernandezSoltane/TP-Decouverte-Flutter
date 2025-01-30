import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Liste bar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Image(
                image: NetworkImage(
                    'https://www.petitfute.com/medias/professionnel/2098176/premium/originale/6645d3290f000.png'),
              ),
              // Ajout de Padding pour le Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                // Padding gauche et droite
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Colonne pour le texte à gauche
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Aligner le texte à gauche
                      children: const [
                        Text(
                          'Désordre',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                        Text(
                          '18 rue Georges Charpak',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                        Text(
                          '35700 Rennes',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    // Ajout d'un espace flexible pour pousser l'icône et le texte à droite
                    Spacer(),
                    // Icône et texte "185" à droite
                    Row(
                      children: [
                        SizedBox(
                            width: 4), // Espacement entre l'icône et le texte
                        Text(
                          '185',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Row(
                  children: [
                    // Icône à gauche
                    Icon(
                      Icons.add_call,
                      color: const Color.fromARGB(255, 12, 15, 221),
                      size: 45,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    // Espace flexible entre les icônes
                    Spacer(),
                    // Icône au milieu
                    Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 12, 15, 221),
                      size: 45,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    // Espace flexible entre les icônes
                    Spacer(),
                    // Icône à droite
                    Icon(
                      Icons.share_outlined,
                      color: const Color.fromARGB(255, 12, 15, 221),
                      size: 45,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      // Permet au contenu de s’étirer correctement
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Alignement à gauche
                        children: [
                          
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
