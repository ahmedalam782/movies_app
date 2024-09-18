import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

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

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TextField(
                style: const TextStyle(color: AppTheme.white),
                focusNode: focusNode,
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
                  setState(() {
                    searchQury = query;
                  });
                },
              ),
            ),
            Expanded(
                child: searchQury.isEmpty
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
                    : Container()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
