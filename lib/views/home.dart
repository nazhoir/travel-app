// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/views/detail.dart';
import 'package:travel_app/model/travel_list.dart';
import 'package:travel_app/views/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.all(10),
          icon: const Icon(Icons.menu_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Menu();
            }));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.jpg",
              height: 80,
            ),
            const Text(
              "TravelApps",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
            ),
            const Icon(Icons.search)
          ],
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(10),
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Jadwal Keberangkatan ${travel.date}",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp. ${travel.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.bookmark_border),
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
