import 'package:flutter/material.dart';
import 'package:travel_app/model/transaksi_list.dart';
import 'package:travel_app/views/currency.dart';

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
        centerTitle: true,
        title: const Text(
          "Riwayat Transaksi",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TransaksiList transaksi = transaksiList[index];
          return InkWell(
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.green,
                    child: ListTile(
                      leading: const Icon(Icons.local_mall_outlined),
                      title: const Text("Belanja"),
                      subtitle: Text(transaksi.date),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (transaksi.status == 1) const Text("Selesai"),
                          const Icon(Icons.more_vert)
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.network(transaksi.image),
                    title: Text(transaksi.name),
                    subtitle: Text(
                        "${transaksi.amount} x ${CurrencyFormat.convertToIdr(transaksi.price, 0)}"),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: transaksiList.length,
      ),
    );
  }
}
