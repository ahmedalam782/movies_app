import 'package:flutter/material.dart';

import '../Themes/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .09,
          vertical: MediaQuery.sizeOf(context).height * .09,
        ),
        child: Text(
          message ?? " SomeThing went Wrong!",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                color: AppTheme.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
