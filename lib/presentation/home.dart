import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDetailsPage extends StatefulWidget {
  final String name;
  final String address;

  const MyDetailsPage({super.key, required String this.name, required String this.address});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  bool isPressed=false;

  void _toggleFavorite() {
    setState(() {
      isPressed = !isPressed; // Inverser l'état au clic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.name),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, 
                      children:  [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                        Text(
                          widget.address,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: isPressed
                              ? Colors.pink
                              : Colors.grey, 
                          iconSize: 45,
                          onPressed: _toggleFavorite,
                        ),
                        SizedBox(
                            width: 4), 
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
                    Icon(
                      Icons.add_call,
                      color: const Color.fromARGB(255, 12, 15, 221),
                      size: 45,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 12, 15, 221),
                      size: 45,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Spacer(),
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
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, 
                        children: [
                          Text(
                            AppLocalizations.of(context)!.descr,
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                          ),
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
    );
  }
}
