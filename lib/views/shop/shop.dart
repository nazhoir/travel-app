import 'package:flutter/material.dart';
import 'package:travel_app/model/product_list.dart';
import 'package:travel_app/views/currency.dart';

import '../menu.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

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
        title: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Icon(Icons.search),
          title: TextField(
            // controller: controller,
            // onChanged: onSearch,
            decoration:
                InputDecoration(hintText: "Search", border: InputBorder.none),
          ),
          trailing: IconButton(
            onPressed: () {
              // controller.clear();
              // onSearch('');
            },
            icon: Icon(Icons.cancel),
          ),
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  size: 30,
                ),
                onPressed: () {},
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
                onPressed: () {},
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 4 / 7,
        ),
        itemCount: productList.length,
        itemBuilder: (BuildContext ctx, index) {
          final ProductList product = productList[index];
          return Card(
            elevation: 1,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 500,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.discount >= 1)
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    color: Colors.red[600]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 13),
                                  child: Text(
                                    "Diskon: ${product.discount}%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Nama Produk
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // Harga

                            if (product.discount >= 1)
                              Text(
                                CurrencyFormat.convertToIdr(
                                    product.price -
                                        (product.discount / 100) *
                                            product.price,
                                    0),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            if (product.discount == 0)
                              Text(
                                CurrencyFormat.convertToIdr(product.price, 0),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            // Harga Asli Sebelum Diskon
                            if (product.discount >= 1)
                              Text(
                                CurrencyFormat.convertToIdr(product.price, 0),
                                style: const TextStyle(
                                    color: Colors.black45,
                                    decoration: TextDecoration.lineThrough),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                          ),
                          Text("${product.rating}"),
                          Text(" | Terjual ${product.sold}"),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.more_vert),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
