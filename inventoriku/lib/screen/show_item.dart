import 'package:flutter/material.dart';
import 'package:inventoriku/models/item_model.dart';
import 'package:inventoriku/widgets/left_drawer.dart';

class MyItem extends StatefulWidget {
  var myItem = DataItem.data;
  MyItem({super.key});

  @override
  State<MyItem> createState() => _MyBudgetState();
}

class _MyBudgetState extends State<MyItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Item"),
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          if (widget.myItem == null || widget.myItem.length == 0)
            const Center(
              child: Text("No Item"),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.myItem.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(widget.myItem[index].name),
                        subtitle: Text(widget.myItem[index].price.toString()),
                        trailing: Column(
                          children: [
                            Text(widget.myItem[index].amount.toString()),
                            Text(widget.myItem[index].description),
                          ],
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
