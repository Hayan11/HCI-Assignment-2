import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  List<MenuItem> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  MenuItem item = menuItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.description),
                      trailing: Text('\$${item.price}'),
                      onTap: () {
                        setState(() {
                          _cartItems.add(item);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Cart (${_cartItems.length} items):'),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  MenuItem item = _cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _cartItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('Place Order'),
              onPressed: () {
                if (_cartItems.isEmpty) {
                  // Display an error message
                } else {
                  // Call the API to place the order
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String name;
  String description;
  double price;

  MenuItem(
      {required this.name, required this.description, required this.price});
}

final List<MenuItem> menuItems = [
  MenuItem(
      name: 'Hamburger',
      description: 'Juicy beef patty with lettuce, tomato, and cheese',
      price: 8.99),
  MenuItem(
      name: 'Pizza',
      description: 'Thin crust pizza with your choice of toppings',
      price: 10.99),
  MenuItem(
      name: 'Salad',
      description: 'Fresh greens with assorted vegetables and dressing',
      price: 6.99),
  // Add more menu items as needed
];
