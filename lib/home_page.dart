import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quoters/get_quoters_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Quoters for life'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.jpeg',
              width: 200.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            const Text(
              'If you lost motivation!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            const Text(
              'If you want to quit everything!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/fenix.jpeg',
              width: 300.0,
              height: 450.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            const Text(
              'Use success quotes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            const Text(
              'of great people!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'And take a screenshot!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200, // <-- match_parent
              height: 50, // <-- match-parent
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.amber)))),
                onPressed: () async {
                  var url = Uri.parse(
                      'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                  var response = await http.get(url);
                  // print('Response status: ${response.statusCode}');
                  // print('Response body: ${response.body}');
                  var data = jsonDecode(response.body);
                  // print(data["quotes"][0]["text"]);
                  // print(data["quotes"][0]["author"]);
                  String quote = data["quotes"][0]["text"];
                  String author = data["quotes"][0]["author"];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetQuotersPage(
                            quoterName: quote, authorName: author)),
                  );
                },
                child: const Text('Do something!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
