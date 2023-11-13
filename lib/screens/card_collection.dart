import 'package:flutter/material.dart';
import 'package:digicard/widgets/left_drawer.dart';
import 'package:digicard/models/card_model.dart';

class CardListPage extends StatelessWidget {
  final List<CardItem> cardItem;

  const CardListPage({Key? key, required this.cardItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koleksi Kartu'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: cardItem.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(cardItem[index].name),
              subtitle: Text('Jumlah: ${cardItem[index].amount}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(cardItem[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Jumlah: ${cardItem[index].amount}'),
                          Text('Deskripsi: ${cardItem[index].description}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
