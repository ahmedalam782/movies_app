import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/view/widgets/category.dart';
import 'package:movies_app_route/browse/view_model/category_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/components/error_indicator.dart';
import '../../../shared/components/loading_indicator.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => categoryViewModel,
      child: Consumer<CategoryViewModel>(builder: (_, categoryViewModel, __) {
        if (categoryViewModel.isLoading) {
          return const LoadingIndicator();
        } else if (categoryViewModel.errorMessage != null) {
          return ErrorIndicator(
            message: categoryViewModel.errorMessage,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Browse Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    childAspectRatio: 2,
                  ),
                  itemCount: categoryViewModel.categoryMovies.length,
                  itemBuilder: (_, int index) {
                    return Category(
                      category: categoryViewModel.categoryMovies[index],
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
