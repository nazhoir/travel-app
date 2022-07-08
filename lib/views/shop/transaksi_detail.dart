import 'package:flutter/material.dart';
import 'package:travel_app/model/transaksi_list.dart';

class TransaksiDetail extends StatelessWidget {
  const TransaksiDetail({Key? key, required this.transaksiList})
      : super(key: key);
  final TransaksiList transaksiList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const ListTile(
          title: Text(
            "Detail Pesanan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        child: Text(transaksiList.name),
      ),
    );
  }
}
