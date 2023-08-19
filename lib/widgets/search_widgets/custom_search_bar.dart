import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  void initState() {
    Provider.of<SearchProvider>(context, listen: false).searchController =
        TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<SearchProvider>(context, listen: false)
        .searchController
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // back button
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(IconlyBroken.arrow_left_2),
        ),

        // search field
        Flexible(
          child: TextFormField(
            magnifierConfiguration: TextMagnifierConfiguration.disabled,
            controller: Provider.of<SearchProvider>(context, listen: false)
                .searchController,
            textInputAction: TextInputAction.search,
            autofocus: true,
            onChanged: (value) {
              if (value.isEmpty) {
                Provider.of<SearchProvider>(context, listen: false)
                    .resetSearchStateToInit();
              }
            },
            onFieldSubmitted: (value) {
              if (value != '') {
                Provider.of<SearchProvider>(context, listen: false)
                    .fetchSearchData(query: value);
              }
            },
            decoration: InputDecoration(
              isDense: true,
              fillColor: Theme.of(context).cardColor,
              filled: true,
              contentPadding: const EdgeInsets.only(
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
            ),
          ),
        ),

        // clear search field button
        IconButton(
          onPressed: () {
            Provider.of<SearchProvider>(context, listen: false)
                .searchController
                .clear();
            Provider.of<SearchProvider>(context, listen: false)
                .resetSearchStateToInit();
          },
          icon: const Icon(
            IconlyBroken.close_square,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
