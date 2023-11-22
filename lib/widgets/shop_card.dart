import 'package:digicard/models/card_model.dart';
import 'package:digicard/screens/list_product.dart';
import 'package:digicard/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:digicard/screens/cardlist_form.dart';
import 'package:digicard/screens/card_collection.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CollectionItem {
  final String name;
  final IconData icon;
  final Color color;

  CollectionItem(this.name, this.icon, this.color);
}

class CardContainer extends StatelessWidget {
  final CollectionItem item;

  const CardContainer(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Kartu") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          } else if (item.name == "Lihat Kartu") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
