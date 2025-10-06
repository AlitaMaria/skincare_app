import 'package:flutter/material.dart';
import 'package:skincare_task/utilities/app_colors.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> items = ["Trending", "New Products", "Highly Rated"];
  List<String> selectedCategories = [""];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: items.map((category) {
              final isSelected = selectedCategories.contains(category);
              return ChoiceChip(
                label: Text(category),
                selected: isSelected,
                showCheckmark: false,

                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedCategories.add(category);
                    } else {
                      selectedCategories.remove(category);
                    }
                  });
                },

                labelStyle: TextStyle(
                  color: isSelected
                      ? AppColors.buttonborder
                      : AppColors.choicebuttontext,
                  fontSize: 13,
                ),

                backgroundColor: AppColors.background,
                selectedColor: AppColors.choicebutton,
                selectedShadowColor: isSelected
                    ? AppColors.categorycolor
                    : AppColors.shadowcolor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: isSelected
                        ? AppColors.buttonborder
                        : AppColors.choicebuttonborder,
                    width: 1.5,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
