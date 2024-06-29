import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              title: Text('Successfully added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text('everyone flies... some fly longer than others'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: value.getShoeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  })),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
