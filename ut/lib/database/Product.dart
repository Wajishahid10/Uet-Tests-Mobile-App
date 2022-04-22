import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/sv1.jpg",
      "assets/images/sv2.jpg",
      "assets/images/sv3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Sieve Analysis",
    price: 764.99,
    description:
        "A sieve analysis is an analytical technique used to determine the particle size distribution of a granular material with macroscopic granular sizes. The sieve analysis technique involves several layers of sieves with different grades of sieve opening sizes.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/lpl1.jpg",
      "assets/images/lpl2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Liquid Limit and Plastic Limit Test",
    price: 650,
    description:
        "Liquid Limit (LL) is the water content at which soil changes from a plastic to a liquid state when the soil specimen is just fluid enough for a groove to close when jarred in a specified manner. Plastic Limit (PL) is the water content at the change from a plastic to a semi-solid state.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/mc1.jpg",
      "assets/images/mc2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Moisture Content (Oven Dry Method)",
    price: 936,
    description:
        "Moisture content is expressed as a percentage of the oven-dry weight of the soil. For example, if a 212-gram moist soil sample weighs 197 grams after drying, the percentage of moisture is calculated by dividing 197 into 15, which gives 7.6 percent.",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
