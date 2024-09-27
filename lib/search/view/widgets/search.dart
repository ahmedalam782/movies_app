import 'package:flutter/material.dart';
import 'package:movies_app_route/search/view/widgets/movies_category_item.dart';

import 'package:movies_app_route/search/view_model/search_view_model.dart';
import 'package:movies_app_route/shared/components/error_indicator.dart';
import 'package:movies_app_route/shared/components/loading_indicator.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../home_datails/view_model/movies_view_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  SearchViewModel searchModel = SearchViewModel();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .07,
                      vertical: MediaQuery.sizeOf(context).height * .04,
                    ),
                    child: TextField(
                      style: const TextStyle(color: AppTheme.white),
                      cursorColor: AppTheme.green,
                      controller: controller,
                      decoration: InputDecoration(
                        fillColor: AppTheme.gray.withOpacity(.3),
                        filled: true,
                        hintText: 'Search',
                        hintStyle:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.white.withOpacity(.46),
                                  fontSize: 14,
                                ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.search_sharp,
                            size: 30,
                            color: AppTheme.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppTheme.white, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppTheme.white, width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppTheme.white, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (query) {
                        searchModel.getSearchMovies(controller.text);
                      },
                    ),
                  ),
                  searchModel.searchResult.isEmpty || controller.text.isEmpty
                      ? Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                                  child:
                                      NotificationListener<ScrollNotification>(
                                    onNotification: (notification) {
                                      if (notification.metrics.pixels ==
                                              notification
                                                  .metrics.maxScrollExtent &&
                                          notification
                                              is ScrollUpdateNotification) {
                                        if (searchModel.hasMore) {
                                          searchModel.getSearchMovies(
                                            controller.text,
                                            isLoadingFromPagination: true,
                                          );
                                        }
                                      }
                                      return true;
                                    },
                                    child: searchModel.errorMessage == null
                                        ? ListView.separated(
                                            itemCount: searchModel
                                                    .searchResult.length +
                                                1,
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
                                              if (index <
                                                  searchModel
                                                      .searchResult.length) {
                                                return MoviesCategoryItem(
                                                  searchResult: searchModel
                                                      .searchResult[index],
                                                );
                                              } else {
                                                return searchModel
                                                        .isLoadingPagination
                                                    ? Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                .05),
                                                        child:
                                                            const LoadingIndicator(),
                                                      )
                                                    : searchModel
                                                                .errorMessage ==
                                                            null
                                                        ? const SizedBox()
                                                        : ErrorIndicator(
                                                            message: searchModel
                                                                .errorMessage,
                                                          );
                                              }
                                            },
                                          )
                                        : ErrorIndicator(
                                            message: searchModel.errorMessage,
                                          ),
                                  ),
                                ),
                ],
              ),
            ),
          ),
        ));
  }
}
