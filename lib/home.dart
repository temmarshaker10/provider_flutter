import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/checkout.dart';
import 'package:provider_flutter/model/cart.dart';
import 'package:provider_flutter/model/product.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "iphone 15 pro max", price: 500),
    Item(name: "S24 Ultra", price: 600),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Home"),
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return CheckOut();
                    }));
                  },
                  icon: Icon(Icons.add_shopping_cart),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.count}");
                    },
                  ),
                )
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListTile(
                  title: Text("${items[i].name}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cart.add(items[i]);
                    },
                  ),
                );
              },
            ));
          },
        ));
  }
}
