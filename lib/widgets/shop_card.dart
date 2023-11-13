import 'package:digicard/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:digicard/screens/cardlist_form.dart';
import 'package:digicard/screens/card_collection.dart';

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
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Kartu") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }

          if (item.name == "Lihat Kartu") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardListPage(cardItem: cardItem)));
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
