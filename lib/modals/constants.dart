import 'package:final_y3/modals/cartmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final cartList = [
  Cartmodal(
      image: "assets/a.jpeg",
      title: "Posho",
      desc: "Desc",
      price: 226,
      quantity: 0),
  Cartmodal(
      image: "assets/a1.jpeg",
      title: "Ground Nuts",
      desc: "Desc",
      price: 236,
      quantity: 0),
  Cartmodal(
      image: "assets/a2.jpeg",
      title: "Cabbages",
      desc: "Desc",
      price: 224,
      quantity: 0),
  Cartmodal(
      image: "assets/a.jpeg",
      title: "Millet",
      desc: "Desc",
      price: 270,
      quantity: 0),
  Cartmodal(
      image: "assets/a3.jpeg",
      title: "Sorghum",
      desc: "Desc",
      price: 426,
      quantity: 0),
  Cartmodal(
      image: "assets/a4.jpeg",
      title: "Title",
      desc: "Desc",
      price: 506,
      quantity: 0),
  Cartmodal(
      image: "assets/a5.jpeg",
      title: "Title",
      desc: "Desc",
      price: 782,
      quantity: 0),
  Cartmodal(
      image: "assets/a6.jpeg",
      title: "Title",
      desc: "Desc",
      price: 326,
      quantity: 0),
  Cartmodal(
      image: "assets/a7.jpeg",
      title: "Title",
      desc: "Desc",
      price: 296,
      quantity: 0),
];
final List<String> sliderImages = [
  'assets/avo.jpeg',
  'assets/b.jpeg',
  'assets/bana.jpeg',
  'assets/food.jpg',
  'assets/grapes.webp',
  'assets/grapes2.jpg',
  'assets/potat.jpg',
  'assets/maize.webp',
  'assets/grapes3.jpg',
  'assets/maize1.webp',
  'assets/potat1.jpg',
  'assets/m.jpeg',
];

const cPrimary = Color(0xFFCBFFC0);
const cOrange = Color(0xFFFFCA28);
const cPrimaryLight = Color(0xFFFFFFF3);
const cAccentColor = Color(0xFFF4C0FF);
const cTextBlack = Color(0xFF000000);

class Character {
  final String name;
  final String imgPath;
  final String description;
  final List<Color> colors;

  Character(this.name, this.imgPath, this.description, this.colors);
}

List characters = [
  Character(
      'Beans',
      'assets/ss.png',
      'Bean, seed or pod of certain leguminous plants of the family Fabaceae. ... Rich in protein and providing moderate amounts of iron, thiamin, and riboflavin, beans are used worldwide for cooking in either fresh or dried form.',
      [Colors.red.shade200, Colors.deepOrange.shade400]),
  Character(
      'Maize',
      'assets/mickey.png',
      'Maize, Zea mays, is an annual grass in the family Poaceae and is a staple food crop grown all over the world. The maize plant possesses a simple stem of nodes and internodes. ... The maize grains, or kernels, are encased in husks and total 30–1000 per ear. The kernels can be white, yellow, red, purple or black.',
      [Colors.green.shade200, Colors.green[400]]),
  Character(
      'Grapes',
      'assets/ss.png',
      'Grapes are fleshy, rounded fruits that grow in clusters made up of many fruits of greenish, yellowish or purple skin. The pulp is juicy and sweet, and it contain several seeds or pips. It is a well-known fruit; it is eaten raw, although it is mainly used for making wine.',
      [Colors.purple[200], Colors.deepPurple]),
  Character(
      'Potatoes',
      'assets/mickey.png',
      'The potato is one of some 150 tuber-bearing species of the genus Solanum (a tuber is the swollen end of an underground stem). The compound leaves are spirally arranged; each leaf is 20–30 cm (about 8–12 inches) long and consists of a terminal leaflet and two to four pairs of leaflets.',
      [Colors.brown[200], Colors.brown[600]])
];
