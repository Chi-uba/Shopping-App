import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ItemsOnSale extends ChangeNotifier {
  // list for the favorite screen
  List<Items> favorite_list = [];
  // list for the my cart list screen
  List<Items> my_cart_list = [];
  // list for special offers
  List<Items>special_offers = [
    Items(name: 'Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: '₦ 5000', category: 'Sports', name_of_list: 'Special Offer List',),
    Items(name: 'Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: '₦ 2000',category: 'Sports', name_of_list: 'Special Offer List',),
    Items(name: 'Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: '₦ 8900',category: 'Sports',name_of_list: 'Special Offer List',),
    Items(name: 'Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: '₦ 16099',category: 'Sports',name_of_list: 'Special Offer List',),
    Items(name: 'Mens Football Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: '₦ 12,300',category: 'Sports',name_of_list: 'Special Offer List',),
  ];

  // list for available offers
  List<Items>offers = [
    Items(name: 'Soccer Ball 1', image: 'soccer ball.jpg', numbers_in_stock: 5, price: '₦ 5000', category: 'Sports', name_of_list: 'Available Offer List',),
    Items(name: 'Shin Guard 1', image: 'shin guard.jpg', numbers_in_stock: 5, price: '₦ 2000',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Goal Keeper Glove1', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: '₦ 8900',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Football Boots Superfly1', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: '₦ 16099',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Men Boots1', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: '₦ 12,300',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: '₦ 5000', category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Shin Guard', image: 'shin guard.jpg', numbers_in_stock: 5, price: '₦ 2000',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Tenth Goal Keeper Glove', image: 'tenth goal keeper gloves.jpg', numbers_in_stock: 5, price: '₦ 8900',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Football Boots Superfly', image: 'football boots suoerfly.jpg', numbers_in_stock: 3, price: '₦ 16099',category: 'Sports',name_of_list: 'Available Offer List',),
    Items(name: 'Mens Boots', image: 'mens spike footbal boots.jpg', numbers_in_stock: 5, price: '₦ 12,300',category: 'Sports',name_of_list: 'Available Offer List',),
  ];

  // function to update item favorite property
     void favoriteChangedFromAvailableOffers(item) {
       offers[offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       notifyListeners();
     }

  void favoriteChangedFromSpecialOffers(item) {
    special_offers[special_offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
    notifyListeners();
  }
     // function to update favorite list
     void updateFavoriteList(Items item){
    if(item.favorite == true) {
      favorite_list.add(item);
    }
    else favorite_list.remove(item);
    notifyListeners();
     }
    // function to update cart list
     void addToCart(Items item) {
      bool alreadyExists = my_cart_list.contains(item) ;
      if(alreadyExists ==true) {}
      else my_cart_list.add(item);
      notifyListeners();
       }
  // function to remove item from favorite list
       void removeFromFavoriteList(Items item) {
       bool ItemExists  = favorite_list.contains(item);
       if(ItemExists == true && item.name_of_list == 'Special Offer List') {
         favorite_list.remove(item);
         special_offers[special_offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       }
       if(ItemExists == true && item.name_of_list == 'Available Offer List') {
         favorite_list.remove(item);
         offers[offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
       }
       else {};
       notifyListeners();
       }

       void removeFromCart(Items item) {
         bool ItemExists  = my_cart_list.contains(item);
         if(ItemExists == true && item.name_of_list == 'Special Offer List') {
           my_cart_list.remove(item);
           special_offers[special_offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
         }
         if(ItemExists == true && item.name_of_list == 'Available Offer List') {
           my_cart_list.remove(item);
           offers[offers.indexWhere((element) => element.name == item.name)].favorite = !item.favorite;
         }
         else {};
         notifyListeners();
       }

       int getTotalPrice() {
       int total_price = 0;
       for(int i = 0; i <= my_cart_list.length; i++) {
         total_price += my_cart_list[i].price as int;
       }
       return total_price;
       }
     }


class Items{
  String? name;
  String? image;
  int? numbers_in_stock;
  String? price;
  String? category;
  bool favorite = false;
  String? name_of_list;

  Items({required this.name, required this.image,
    required this.numbers_in_stock, required this.price, required this.category, required this.name_of_list});
}