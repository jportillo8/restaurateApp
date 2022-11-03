import 'package:flutter/material.dart';

class RestaurantOrdersListPage extends StatelessWidget {
  const RestaurantOrdersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: const Center(
        child: Text('Restaurante Orders List'),
      ),
    );
  }
}
