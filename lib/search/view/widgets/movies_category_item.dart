import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

import '../../../movies_details/view/screens/movie_details_new.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/end_point.dart';

class MoviesCategoryItem extends StatelessWidget {
  const MoviesCategoryItem({super.key, required this.searchResult});

  final SearchResult searchResult;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: searchResult,
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * .05,
          vertical: height * .01,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${EndPoint.imageBaseUrl}${searchResult.backdropPath ?? searchResult.posterPath}",
                        placeholder: (context, url) => const LoadingIndicator(),
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.image_not_supported,
                          color: AppTheme.white,
                        ),
                        height: 100,
                        width: searchResult.backdropPath == null ? 100 : 150,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: TextDirection.ltr,
                      top: searchResult.backdropPath == null ? -14.5 : -6.5,
                      start: searchResult.backdropPath == null ? -4 : -18.5,
                      child: IconButton(
                        onPressed: () {},
                        icon: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 50,
                              color: AppTheme.darkGray.withOpacity(.87),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppTheme.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * .06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchResult.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Text(
                          searchResult.releaseDate ?? "",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 13,
                                    color: AppTheme.white.withOpacity(.67),
                                  ),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppTheme.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              searchResult.voteAverage?.toStringAsFixed(1) ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 13,
                                    color: AppTheme.white.withOpacity(.67),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .001,
            ),
          ],
        ),
      ),
    );
  }
}
