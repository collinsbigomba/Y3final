import 'package:final_y3/modals/scbcontainerdata.dart';
import 'package:flutter/widgets.dart';

import 'Foodscbcont.dart';

class StaticData {
  static final List<Category> categories = [
    //Category(1, 'Foods'),
    //Category(2, 'Discounts'),
    //Category(3, 'Offers'),
  ];
  static final List<Food> foods = [
    Food(1, 'Coffee', 'The best around Nkozi', 800,
        AssetImage('assets/coffee.jpeg')),
    Food(2, 'Beans', 'The best around Nkozi', 300,
        AssetImage('assets/coffee.jpeg')),
    Food(3, 'Sorghum', 'Quality over Quantity', 400,
        AssetImage('assets/coffee.jpeg')),
    Food(4, 'Mattoke', 'The best around Nkozi', 680,
        AssetImage('assets/coffee.jpeg')),
    Food(5, 'Egg plants', 'The best around Nkozi', 780,
        AssetImage('assets/coffee.jpeg')),
    Food(6, 'Avocado', 'The best around Nkozi', 980,
        AssetImage('assets/coffee.jpeg')),
       
  ];
}
