import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: Container(
          color: Colors.amber[800],
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              Text("user@email.com")
            ],
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Pegawai"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Transaksi"),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(Icons.emoji_emotions),
              title: const Text("Profil"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Tentang"),
              onTap: () {},
            ),
          ],
        ),
      );
}
