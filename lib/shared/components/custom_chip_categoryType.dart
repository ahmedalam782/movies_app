import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/genre.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class CustomChipBuilderWidget extends StatefulWidget {
  final List<Genre> movieDetails;

  const CustomChipBuilderWidget({super.key, required this.movieDetails});

  @override
  State<CustomChipBuilderWidget> createState() =>
      _CustomChipBuilderWidgetState();
}

class _CustomChipBuilderWidgetState extends State<CustomChipBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 1.0,
        children: List.generate(
          widget.movieDetails.length,
          (index) => GestureDetector(
            onTap: () {},
            child: Chip(
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppTheme.gray)),
              label: Text(
                widget.movieDetails[index].name ?? "",
              ),
              backgroundColor: AppTheme.black,
            ),
          ),
        ),
      ),
    );
  }
}
