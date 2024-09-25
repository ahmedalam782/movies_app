import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

import '../../movies_details/data/models/movie_details_response/genre.dart';

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
    return Wrap(
      spacing: 10.0,
      runSpacing: .5,
      children: List.generate(
        widget.movieDetails.length,
        (index) => Chip(
          labelStyle:
              Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:  BorderSide(
              color: AppTheme.gray.withOpacity(.3),
            ),
          ),
          label: Text(
            widget.movieDetails[index].name ?? "",
          ),
          backgroundColor: AppTheme.black,
        ),
      ),
    );
  }
}
