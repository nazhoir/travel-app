import 'package:flutter/material.dart';
import 'package:travel_app/views/bookmark.dart';
import 'package:travel_app/model/travel_list.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.travel}) : super(key: key);
  final TravelList travel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        travel.image,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black45,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const BookmarkButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                travel.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("Rp.${travel.price}/pax"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text("Pesan Sekarang"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(travel.description),
            ),
            ListTile(
              leading: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 40,
              ),
              title: const Text("Kuota Jama'ah :"),
              subtitle:
                  Text("${travel.kuota} Jama'ah. Sisa Kuota : ${travel.kuota}"),
            ),
            ListTile(
              leading: const Icon(
                Icons.airplanemode_active,
                size: 40,
              ),
              title: const Text("Bandara Keberangkatan :"),
              subtitle: Text(travel.airport),
            ),
            ListTile(
              leading: const Icon(
                Icons.date_range_outlined,
                size: 40,
              ),
              title: const Text("Tanggal Keberangkatan :"),
              subtitle: Text(travel.date),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_work_outlined,
                size: 40,
              ),
              title: const Text("Lokasi Hotel :"),
              subtitle: Text(travel.hotel),
            ),
          ],
        ),
      ),
    );
  }
}
