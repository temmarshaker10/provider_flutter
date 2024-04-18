import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/cart.dart';
import './model/product.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => __CheckOutState();
}

class __CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckOut"),
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.bashetitem.length,
                itemBuilder: (contxet, i) {
                  return Card(
                    child: ListTile(
                      title: Text("${cart.bashetitem[i].name}"),
                      trailing: IconButton(
                        onPressed: () {
                          cart.remove(cart.bashetitem[i]);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
