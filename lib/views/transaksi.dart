import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.all(10),
          icon: const Icon(Icons.bookmark, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Riwayat Transaksi",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
            ),
            Icon(Icons.search)
          ],
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
