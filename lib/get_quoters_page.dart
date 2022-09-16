import 'package:flutter/material.dart';

class GetQuotersPage extends StatelessWidget {
  String quoterName;
  String authorName;

  GetQuotersPage(
      {super.key, required this.quoterName, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const Text('Quoters'),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/dragon.jpeg',
                  width: 400.0,
                  height: 350.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 55),
                  child: Text(quoterName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 80.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      authorName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

        // Container(
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     child: Text('ok'),
        //   ),
        // )
        );
  }
}
