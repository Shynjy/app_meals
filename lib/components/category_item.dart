import 'package:flutter/material.dart';

import '../models/category_meals.dart';
import '../utils/app_routes.dart';
// import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryMeals category;

  const CategoryItem(this.category);

  void _selectCaregory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //   builder: (_) {
    //     return CategoriesMealsScreen(category);
    //   },
    // ));
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => _selectCaregory(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  category.color,
                  category.color.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
      ),
    );
  }
}
