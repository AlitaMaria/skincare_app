import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../state_management/Search/search_content.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_styles.dart';
import 'debouncer.dart';

class Search extends StatefulWidget {
  final String? searchContent;

  const Search({super.key, this.searchContent});

  static String route = "Search";


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SearchContent search;
  TextEditingController searchController = TextEditingController();

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
      search = Provider.of<SearchContent>(context, listen: false);
      search.clearSearchModel();
    // });
  }

  @override
  Widget build(BuildContext context) {
    SearchContent search = Provider.of<SearchContent>(context, listen: false);
    print(search);
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {

            return

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                onChanged: (value) {
                                  _debouncer.run(() {
                                    search.getSearchCharacters(
                                          (context),
                                          Search: searchController.text,
                                        );
                              
                                    print("Searching for: $value");
                                  });
                                },
                              
                                // onChanged: (_) {
                                //
                                // },
                                decoration: InputDecoration(
                                  hint: Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/search-line 1.png",
                                        height: 22,
                                        width: 22,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 12,
                                          top: 1,
                                          bottom: 1,
                                        ),
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
                                ),
                              ),
                            ),
                          ],
                        ),

                        Observer(
                          builder: (_) {
                            if (search.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (search.hasException ||
                                search.searchModel?.characters?.results == null ||
                                search.searchModel!.characters!.results!.isEmpty) {
                              return Center(child: Text("Search Something "));
                            }
                            final searchResult = search.searchModel!.characters!.results;

                            return Expanded(
                              child: ListView.builder(
                                itemCount: searchResult?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(title: Text(searchResult![index].name!));
                                },
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ),


            );
          },
        ),
      ),
    );
  }
}
