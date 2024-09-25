import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/data/models/genres_movies.dart';
import 'package:movies_app_route/movies_category_details/view/widgets/movies_category_item.dart';
import 'package:movies_app_route/movies_category_details/view_model/movies_category_details_view_model.dart';

import 'package:provider/provider.dart';

import '../../../shared/components/error_indicator.dart';
import '../../../shared/components/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = '/category_details';

  const CategoryDetails({
    super.key,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  bool isShow = false;
  MoviesCategoryDetailsViewModel moviesCategoryDetailsViewModel =
      MoviesCategoryDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    Genres category = ModalRoute.of(context)!.settings.arguments as Genres;
    if (isShow == false) {
      moviesCategoryDetailsViewModel
          .getMoviesCategoryDetails(category.id.toString());
      isShow = true;
      setState(() {});
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name ?? ""),
      ),
      body: ChangeNotifierProvider(
        create: (_) => moviesCategoryDetailsViewModel,
        child: Consumer<MoviesCategoryDetailsViewModel>(
            builder: (_, moviesCategoryDetailsViewModel, __) {
          if (moviesCategoryDetailsViewModel.isLoading) {
            return const LoadingIndicator();
          } else if (moviesCategoryDetailsViewModel.errorMessage != null) {
            return ErrorIndicator(
              message: moviesCategoryDetailsViewModel.errorMessage,
            );
          } else {
            return ListView.separated(
              itemCount: moviesCategoryDetailsViewModel.moviesItems.length,
              separatorBuilder: (_, int index) => Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: width * .05,
                ),
                child: const Divider(),
              ),
              itemBuilder: (_, int index) {
                return MoviesCategoryItem(
                  moviesItems:
                      moviesCategoryDetailsViewModel.moviesItems[index],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
