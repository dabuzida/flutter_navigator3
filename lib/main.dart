import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedItem;
  String? _selectedRoute;
  bool show404 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator3',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('ItemListScreen'),
            child: ItemsListScreen(
                // onItemTapped: _handleItemTapped,
                // onRouteTapped: _handleRouteTapped,
                ),
          ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }

  void _handleItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  void _handleRouteTapped(String route) {
    setState(() {
      _selectedItem = null;
      _selectedRoute = route;
    });
  }
}

class ItemsListScreen extends StatelessWidget {
  const ItemsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => const ItemDetailsScreen()),);
          },
          title: Text('Item $index'),
        ),
        itemCount: 10,
      ),
    );
  }
}
