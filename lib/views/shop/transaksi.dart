import 'package:flutter/material.dart';
import 'package:travel_app/model/transaksi_list.dart';
import 'package:travel_app/views/currency.dart';
import 'package:travel_app/views/shop/transaksi_detail.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.local_mall_outlined),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Belanja",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            transaksi.date,
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //
                          // Cek Status Selesai
                          if (transaksi.status == 1)
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Selesai",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                          // Cek Status Pending
                          if (transaksi.status == 2)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Pending",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          const Icon(Icons.more_vert)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TransaksiDetail(transaksiList: transaksi);
                            },
                          ),
                        );
                      },
                      leading: Image.network(transaksi.image),
                      title: Text(
                        transaksi.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "${transaksi.amount} x ${CurrencyFormat.convertToIdr(transaksi.price, 0)}"),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Belanja: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(CurrencyFormat.convertToIdr(
                              transaksi.price * transaksi.amount, 0))
                        ],
                      ),
                      trailing: ElevatedButton(
                        child: const Text("Beli Lagi"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: transaksiList.length,
      ),
    );
  }
}
