import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
// import 'package:skincare_task/utilities/app_styles.dart';
import 'package:skincare_task/utilities/utilities.dart';
import 'package:skincare_task/views/category.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 220, 213),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://cdn.shopify.com/s/files/1/0668/0022/2505/files/e6f5c62c3f884.jpg?v=1718196963",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            Text(
              "An Evolving",
              style: Styles.boldtextsTYLE(
                fontsize: 20,
                color: AppColors.textcolor,
              ),
            ),
            Text(
              "collection of treatments",
              style: Styles.boldtextsTYLE(
                fontsize: 20,
                color: AppColors.textcolor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "The Ordinary is born  to disallow commodity to be disguised as ingenuity. The Ordinary is Clinical formulations with integrity",
                style: Styles.getRegulartext(
                  fontsize: 15,
                  color: AppColors.textcolor,
                ),
              ),
            ),

            FloatingActionButton(
              onPressed: () {
                // context.go('/home');
                context.pushNamed(Category.route);
              },

              backgroundColor: AppColors.buttoncolor,
              foregroundColor: AppColors.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              child: const Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      ),
    );
  }
}
