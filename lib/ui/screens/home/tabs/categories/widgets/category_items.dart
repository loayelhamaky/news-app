import 'package:flutter/material.dart';

class CategoryItem {
  String? id;
  String title;
  String imageBath;
  Color color;
  CategoryItem({required this.id, required this.title, required this.imageBath,required this.color});

  static CategoryItem sports = CategoryItem(id: 'sports', title: 'football', imageBath: 'lib/assets/images/img_1.png', color: Colors.red);
  static CategoryItem technology = CategoryItem(id: 'technology', title: 'technology', imageBath: 'lib/assets/images/img_9.png', color: const Color(0xff003E90));
  static CategoryItem health = CategoryItem(id: 'health', title: 'health', imageBath: 'lib/assets/images/img_10.png', color: const Color(0xffED1E79));
  static CategoryItem business = CategoryItem(id: 'business', title: 'business', imageBath: 'lib/assets/images/img_1.png', color: const Color(0xffCF7E48));
  static CategoryItem entertainment = CategoryItem(id: 'entertainment', title: 'entertainment', imageBath: 'lib/assets/images/img_7.png', color: const Color(0xff4882CF));
  static CategoryItem science = CategoryItem(id: 'science', title: 'science', imageBath: 'lib/assets/images/img_8.png', color: const Color(0xffF2D352));

  static List<CategoryItem> categoryList = [sports,technology,health,business,entertainment,science];



  static sportsItem(String title, String imageBath, Color color, ) {
    return Container(
      padding: const EdgeInsets.only(top: 12),

      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      ),
    );
  }

  static technologyItem(String title, String imageBath, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 12),

      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.zero,
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 19, color: Colors.white),
          )
        ],
      ),
    );
  }

  static healthItem(String title, String imageBath, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      ),
    );
  }

  static businessItem(String title, String imageBath, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 6),

      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.zero,
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }

  static entertainmentItem(String title, String imageBath, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 12),

      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 19, color: Colors.white),
          )
        ],
      ),
    );
  }

  static scienceItem(String title, String imageBath, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 15),

      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.zero,
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      height: 175,
      width: 135,
      child: Column(
        children: [
          Image.asset(imageBath),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
