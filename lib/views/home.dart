import 'package:flutter/material.dart';
import 'package:travel_app/views/detail.dart';
import 'package:travel_app/model/travel_list.dart';
import 'package:travel_app/views/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "TravelApps",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     padding: const EdgeInsets.all(10),
        //     icon: const Icon(Icons.search, color: Colors.black),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => const Search()));
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TravelList travel = travelList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(
                  travel: travel,
                );
              }));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            travel.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      travel.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Jadwal Keberangkatan ${travel.date}",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp. ${travel.price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const Icon(Icons.bookmark_border),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: travelList.length,
      ),
    );
  }
}
