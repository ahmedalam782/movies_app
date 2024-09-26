import 'package:flutter/material.dart';
import 'package:movies_app_route/search/view/widgets/movies_category_item.dart';

import 'package:movies_app_route/search/view_model/search_view_model.dart';
import 'package:movies_app_route/shared/components/error_indicator.dart';
import 'package:movies_app_route/shared/components/loading_indicator.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  String searchQury = '';
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  SearchViewModel searchModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => searchModel,
        child: Consumer<SearchViewModel>(
          builder: (_, searchModel, __) => Scaffold(
            backgroundColor: AppTheme.black,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextField(
                      style: const TextStyle(color: AppTheme.white),
                      cursorColor: Colors.green,
                      controller: controller,
                      decoration: InputDecoration(
                        fillColor: AppTheme.darkGray,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppTheme.gray),
                        prefixIcon: Icon(
                          Icons.search,
                          color: isFocused ? AppTheme.white : AppTheme.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppTheme.gray,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppTheme.white,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppTheme.white,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onChanged: (query) {
                        searchModel.getSearchMovies(controller.text);
                      },
                    ),
                  ),
                  searchModel.searchResult.isEmpty || controller.text.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/no_movies.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'No movies found',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppTheme.gray),
                              ),
                            ],
                          ),
                        )
                      : searchModel.isLoading
                          ? const LoadingIndicator()
                          : searchModel.errorMessage != null
                              ? ErrorIndicator(
                                  message: searchModel.errorMessage,
                                )
                              : Expanded(
                                  child: ListView.separated(
                                      itemCount:
                                          searchModel.searchResult.length,
                                      separatorBuilder: (_, int index) =>
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      .05,
                                            ),
                                            child: const Divider(),
                                          ),
                                      itemBuilder: (_, int index) {
                                        return MoviesCategoryItem(
                                          searchResult:
                                              searchModel.searchResult[index],
                                        );
                                      }),
                                ),
                ],
              ),
            ),
          ),
        ));
  }
}
