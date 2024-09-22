import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class CustomChipBuilderWidget extends StatefulWidget {
  const CustomChipBuilderWidget({super.key});

  @override
  State<CustomChipBuilderWidget> createState() =>
      _CustomChipBuilderWidgetState();
}

class _CustomChipBuilderWidgetState extends State<CustomChipBuilderWidget> {
  List<String> chipData = [
    'Fantacy',
    'Action',
    'Drama',
    'Romance',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 1.0,
        children: List.generate(
          chipData.length,
          (index) => GestureDetector(
            onTap: () {},
            child: Chip(
              // onDeleted: () {
              //   setState(() {
              //     // Remove the chip from the list and update the state
              //     chipData.removeAt(index);
              //   });
              // },
              // deleteIcon:
              //     const Icon(Icons.close, size: 18, color: Colors.black),
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppTheme.gray)),
              label: Text(
                chipData[index],
              ),
              backgroundColor: AppTheme.black,
            ),
          ),
        ),
      ),
    );
  }
}
