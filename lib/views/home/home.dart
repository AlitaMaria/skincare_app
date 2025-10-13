import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skincare_task/utilities/utilities.dart';
import 'package:skincare_task/utilities/widgets/listview/categories.dart';
import 'package:skincare_task/utilities/widgets/listview/product_collections.dart';
import 'package:skincare_task/utilities/widgets/listview/products.dart';
import 'package:skincare_task/views/Search/search.dart';
import 'package:skincare_task/views/graphql_test_view.dart';

import '../character_listing_page.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            onTap: ()=>context.pushNamed(
              Search.route,
            ),
            child: TextField(
            enabled: false,
              decoration: InputDecoration(
                hint: Row(
                  children: [
                    Image.asset(
                      "assets/icons/search-line 1.png",
                      height: 22,
                      width: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 1, bottom: 1),
                      child: Text(
                        "Search Products",
                        style: Styles.getRegulartext(
                          fontsize: 15,
                          color: AppColors.searchbartext,
                        ),
                      ),
                    ),
                  ],
                ),
                hintStyle: TextStyle(color: Color.fromARGB(255, 238, 236, 236)),
                enabledBorder: searchBorder(),

                focusedBorder: searchBorder(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "Browse by categories",
                style: Styles.boldtextsTYLE(fontsize: 20),
              ),
              Spacer(),
              TextButton(
                onPressed: () {

                  context.pushNamed(
                      CharacterListingPage.route, );
                },
                child: Text(
                  "View All",
                  style: Styles.getsmalltext(
                    fontsize: 13,
                    color: AppColors.buttoncolor,
                    underline: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(7.0), child: Categories()),
        const Products(),

        // Padding(padding: EdgeInsetsGeometry.only(top: 10, bottom: 10)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "Product Collections",
                style: Styles.boldtextsTYLE(fontsize: 20),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  context.pushNamed(GraphqlTestView.route);
                },
                child: Text(
                  "View All",
                  style: Styles.getsmalltext(
                    fontsize: 13,
                    color: AppColors.buttoncolor,
                    underline: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ProductCollections(),
        ),
      ],
    );
  }

  OutlineInputBorder searchBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.searchbar),
    );
  }
}
