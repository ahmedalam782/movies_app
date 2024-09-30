import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view_model/movies_view_model.dart';
import 'package:movies_app_route/watchlist/view/widgets/movies_watchlist_item.dart';
import 'package:provider/provider.dart';

import '../../../shared/Themes/app_theme.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    MoviesViewModel moviesViewModel = Provider.of<MoviesViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Watchlist',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        moviesViewModel.moviesWatchlist.isEmpty
            ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        'No movies found in WatchList',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.gray,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                itemCount: moviesViewModel.moviesWatchlist.length,
                separatorBuilder: (_, int index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .05,
                  ),
                  child: const Divider(),
                ),
                itemBuilder: (_, int index) {
                  return MoviesWatchlistItem(
                    moviesWatchlist: moviesViewModel.moviesWatchlist[index],
                  );
                },
              )),
      ],
    );
  }
}
