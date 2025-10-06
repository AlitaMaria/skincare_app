import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skincare_task/utilities/app_colors.dart';
import 'package:skincare_task/utilities/app_styles.dart';
import 'package:skincare_task/views/mainscreen.dart';

class Category extends StatefulWidget {
  const Category({super.key});
  static String route = '/Home';
  @override
  State<Category> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<Category> {
  // Category list
  final List<String> categories = [
    "Show All",
    "Perfume",
    "Moisturizer",
    "Shampoo",
    "Gift Cards",
    "Toner",
    "Face oils",
    "Foundation",
    "Suncare",
    "Tools",
  ];

  // Store selected categories
  final Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                "Choose your favourite \n category",
                style: Styles.boldtextsTYLE(
                  fontsize: 32,
                  color: AppColors.textcolor,
                ),
              ),
              Text(
                "You can choose more than one",
                style: Styles.getRegulartext(
                  fontsize: 18,
                  color: AppColors.fadedtext,
                ),
              ),
              const SizedBox(height: 8),

              // Category Buttons
              Expanded(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: categories.map((category) {
                    final isSelected = selectedCategories.contains(category);
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
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
                        color: isSelected ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFFB7C29C), // soft green
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Continue Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(Mainscreen.route);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB7C29C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Continue",
                      style: Styles.getRegulartext(
                        fontsize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip for now",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
