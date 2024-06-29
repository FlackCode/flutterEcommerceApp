import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Dunks',
        price: '250',
        imagePath: 'assets/img/dunks.png',
        description: 'Cool shoe with an awesome design'),
    Shoe(
        name: 'Nike High Sneakers',
        price: '230',
        imagePath: 'assets/img/sneakers.png',
        description: 'Cool shoe with an awesome design'),
    Shoe(
        name: 'Nike Low Sneakers',
        price: '190',
        imagePath: 'assets/img/nikeshoes.png',
        description: 'Cool shoe with an awesome design'),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
