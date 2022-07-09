import 'package:flutter/material.dart';
import 'package:travel_app/model/product_list.dart';

import '../currency.dart';
import '../menu.dart';

class Product extends StatefulWidget {
  const Product({Key? key, required this.productList}) : super(key: key);
  final ProductList productList;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int counter = 0;

  void _minCounter() {
    setState(() {
      counter--;
    });
  }

  _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
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
          contentPadding: EdgeInsets.all(0),
          leading: Icon(Icons.search),
          title: TextField(
            // controller: controller,
            // onChanged: onSearch,
            decoration:
                InputDecoration(hintText: "Search", border: InputBorder.none),
          ),
          // trailing: IconButton(
          //   onPressed: () {
          //     // controller.clear();
          //     // onSearch('');
          //   },
          //   icon: const Icon(Icons.cancel),
          // ),
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  size: 22,
                ),
                onPressed: () {},
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              CrossAxisAlignment.center;
              MainAxisAlignment.center;
              return Container(
                padding: const EdgeInsets.only(top: 5),
                height: 22,
                width: 42,
                child: Stack(children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        // height: 10,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 3),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Text(
                          "10",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 9),
                        )),
                  )
                ]),
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 22,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          // IconButton(
          //   padding: const EdgeInsets.all(10),
          //   icon: const Icon(Icons.shopping_cart, color: Colors.black),
          //   onPressed: () {
          //     Scaffold.of(context).openDrawer();
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.productList.image,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              minVerticalPadding: 20,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.productList.discount >= 1)
                    Text(
                      CurrencyFormat.convertToIdr(
                          widget.productList.price -
                              (widget.productList.discount / 100) *
                                  widget.productList.price,
                          0),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  if (widget.productList.discount == 0)
                    Text(
                      CurrencyFormat.convertToIdr(widget.productList.price, 0),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  // Harga Asli Sebelum Diskon
                  if (widget.productList.discount >= 1)
                    Text(
                      CurrencyFormat.convertToIdr(widget.productList.price, 0),
                      style: const TextStyle(
                          color: Colors.black45,
                          decoration: TextDecoration.lineThrough),
                    )
                ],
              ),
              subtitle: Text(
                widget.productList.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text('${widget.productList.minbuy + counter} '),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  onPressed: _minCounter,
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white,
                    primary: Colors.amber[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Beli Sekarang"),
                ),
                buildButton(
                  styls: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.amber),
                    shadowColor: Colors.white,
                    primary: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                  ),
                  text: "Keranjang",
                  onCLicked: () => showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => buildBottomSheet(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onCLicked,
    required styls,
  }) =>
      ElevatedButton(
        onPressed: onCLicked,
        style: styls,
        child: Text(text),
      );

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        // onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildBottomSheet(BuildContext context) => makeDismissible(
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.5,
          maxChildSize: 0.6,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Icon(Icons.horizontal_rule)),
                ListTile(
                  title: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.network(
                                widget.productList.image,
                                width: 125,
                                height: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 125,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget.productList.discount == 0)
                                      Text(
                                        CurrencyFormat.convertToIdr(
                                            widget.productList.price, 0),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    if (widget.productList.discount >= 1)
                                      Text(
                                        CurrencyFormat.convertToIdr(
                                            widget.productList.price -
                                                (widget.productList.discount /
                                                        100) *
                                                    widget.productList.price,
                                            0),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    if (widget.productList.discount >= 1)
                                      Row(
                                        children: [
                                          Text(
                                            "${widget.productList.discount}%  ",
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            CurrencyFormat.convertToIdr(
                                                widget.productList.price, 0),
                                            style: const TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          )
                                        ],
                                      ),
                                    Text("Stock : ${widget.productList.stock}")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // minLeadingWidth: 125,
                  trailing: SizedBox(
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: const [
                      Text(
                        "Pilihan Varian :",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _minCounter,
                              clipBehavior: Clip.antiAlias,
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.white,
                                primary: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            Text('${widget.productList.minbuy + counter} '),
                            // const SizedBox(
                            //   width: 50,
                            //   height: 35,
                            //   child: TextField(
                            //     textAlign: TextAlign.center,
                            //     decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.black)),
                            //     ),
                            //   ),
                            // ),
                            ElevatedButton(
                              onPressed: _incrementCounter,
                              clipBehavior: Clip.antiAlias,
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.white,
                                primary: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.amber,
                            size: 14,
                          ),
                          label: const Text(
                            "Keranjang",
                            style: TextStyle(color: Colors.amber),
                          ),
                          clipBehavior: Clip.antiAlias,
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.amber),
                            shadowColor: Colors.white,
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
