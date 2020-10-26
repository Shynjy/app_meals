import 'package:flutter/material.dart';

class CategoryMeals {
  final String id;
  final String title;
  final Color color;

  const CategoryMeals({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
