import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventoriku/models/item.dart';
import 'package:inventoriku/widgets/left_drawer.dart';
import 'package:inventoriku/screen/itemdetail.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: LeftDrawer(),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(item.fields.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    const Text('Jumlah: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.fields.amount.toString()),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Harga: Rp.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.fields.price.toString()),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Deskripsi: ',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    Text(item.fields.description),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
