import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HimaHomePage(title: 1),
    );
  }
}

class HimaHomePage extends StatefulWidget {
  int title;
  HimaHomePage({
    required this.title,
    super.key,
  });

  @override
  State<HimaHomePage> createState() => _HimaHomePageState();
}

class _HimaHomePageState extends State<HimaHomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.title = widget.title + 1;
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: searchController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffix: Container(
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.mic),
                          Icon(Icons.clear),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: Text("Google Search")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text("I'm feeling lucky"))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text(
                'Google offered in: हिन्दी বাংলা తెలుగు मराठी தமிழ் ગુજરાતી ಕನ್ನಡ മലയാളം ਪੰਜਾਬੀ',
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
